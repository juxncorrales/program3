defmodule NodoServidor do
  @nombre_servicio_local :servicio_cadenas

  def main() do
    Util.mostrar_mensaje("PROCESO SECUNDARIO")
    registrar_servicio(@nombre_servicio_local)
    loop(%{}, %{}) # usuarios, salas
  end

  defp registrar_servicio(nombre_servicio_local),
    do: Process.register(self(), nombre_servicio_local)

  defp loop(usuarios, salas) do
    receive do
      {:registrar, nombre_usuario, cliente_pid} ->
        IO.inspect({:registrar, nombre_usuario, cliente_pid}, label: "Servidor recibió")
        Util.mostrar_mensaje("Usuario registrado: #{nombre_usuario} (#{inspect(cliente_pid)})")
        send(cliente_pid, {:registro_exitoso, nombre_usuario})
        loop(Map.put(usuarios, nombre_usuario, cliente_pid), salas)

      {:listar_usuarios, remitente} ->
        IO.inspect({:listar_usuarios, remitente}, label: "Servidor recibió")
        send(remitente, {:usuarios_conectados, Map.keys(usuarios)})
        loop(usuarios, salas)

      {:crear_sala, nombre_sala, remitente} ->
        IO.inspect({:crear_sala, nombre_sala, remitente}, label: "Servidor recibió")
        if Map.has_key?(salas, nombre_sala) do
          send(remitente, {:error, "La sala #{nombre_sala} ya existe."})
        else
          Util.mostrar_mensaje("Sala creada: #{nombre_sala}")
          send(remitente, {:sala_creada, nombre_sala})
          loop(usuarios, Map.put(salas, nombre_sala, []))
        end

      {:unirse_sala, nombre_sala, nombre_usuario, remitente} ->
        IO.inspect({:unirse_sala, nombre_sala, nombre_usuario, remitente}, label: "Servidor recibió")
        if Map.has_key?(salas, nombre_sala) do
          usuarios_en_sala = Map.get(salas, nombre_sala)
          if nombre_usuario in usuarios_en_sala do
            send(remitente, {:error, "Ya estás en la sala #{nombre_sala}."})
          else
            salas_actualizadas = Map.put(salas, nombre_sala, [nombre_usuario | usuarios_en_sala])
            send(remitente, {:unido_a_sala, nombre_sala})
            loop(usuarios, salas_actualizadas)
          end
        else
          send(remitente, {:error, "La sala #{nombre_sala} no existe."})
          loop(usuarios, salas)
        end

      {:mensaje_sala, nombre_sala, remitente, mensaje} ->
        IO.inspect({:mensaje_sala, nombre_sala, remitente, mensaje}, label: "Servidor recibió")
        if Map.has_key?(salas, nombre_sala) do
          usuarios_en_sala = Map.get(salas, nombre_sala)
          Enum.each(usuarios_en_sala, fn usuario ->
            if Map.has_key?(usuarios, usuario) do
              send(Map.get(usuarios, usuario), {:mensaje_sala, nombre_sala, remitente, mensaje})
            else
              IO.inspect({:usuario_no_encontrado, usuario}, label: "Error al enviar mensaje")
            end
          end)
        else
          send(remitente, {:error, "La sala #{nombre_sala} no existe."})
        end
        loop(usuarios, salas)

      {:desconectar, nombre_usuario} ->
        IO.inspect({:desconectar, nombre_usuario}, label: "Servidor recibió")
        Util.mostrar_mensaje("Usuario desconectado: #{nombre_usuario}")
        usuarios_actualizados = Map.delete(usuarios, nombre_usuario)
        salas_actualizadas = Enum.reduce(salas, %{}, fn {sala, usuarios_en_sala}, acc ->
          Map.put(acc, sala, Enum.filter(usuarios_en_sala, fn usuario -> usuario != nombre_usuario end))
        end)
        loop(usuarios_actualizados, salas_actualizadas)

      _ ->
        Util.mostrar_error("Mensaje no reconocido.")
        loop(usuarios, salas)
    end
  end
end

NodoServidor.main()

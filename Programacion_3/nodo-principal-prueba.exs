defmodule NodoCliente do
  @nodo_remoto :nodoservidor@localhost
  @servicio_remoto {:servicio_cadenas, @nodo_remoto}

  def main() do
    Util.mostrar_mensaje("Bienvenido al chat. Escriba '/help' para ver los comandos disponibles.")
    if Node.connect(@nodo_remoto) do
      nombre_usuario = solicitar_nombre_usuario()
      send(@servicio_remoto, {:registrar, nombre_usuario, self()})
      spawn(fn -> recibir_respuestas(nombre_usuario, nil) end) # Proceso separado para manejar respuestas
      manejar_comandos(nombre_usuario, nil)
    else
      Util.mostrar_error("No se pudo conectar con el nodo servidor")
    end
  end

  defp solicitar_nombre_usuario() do
    Util.ingresar("Ingrese su nombre de usuario: ", :texto)
  end

  defp manejar_comandos(nombre_usuario, sala_actual) do
    comando = Util.ingresar("#{nombre_usuario}> ", :texto)
    IO.inspect({:comando_ingresado, comando}, label: "Cliente envió")

    case String.split(comando, " ", parts: 2) do
      ["/help"] ->
        mostrar_comandos()
        manejar_comandos(nombre_usuario, sala_actual)

      ["/list"] ->
        send(@servicio_remoto, {:listar_usuarios, self()})
        IO.inspect({:listar_usuarios, self()}, label: "Cliente envió")
        manejar_comandos(nombre_usuario, sala_actual)

      ["/create", nombre_sala] ->
        send(@servicio_remoto, {:crear_sala, nombre_sala, self()})
        IO.inspect({:crear_sala, nombre_sala, self()}, label: "Cliente envió")
        manejar_comandos(nombre_usuario, sala_actual)

      ["/join", nombre_sala] ->
        send(@servicio_remoto, {:unirse_sala, nombre_sala, nombre_usuario, self()})
        IO.inspect({:unirse_sala, nombre_sala, nombre_usuario, self()}, label: "Cliente envió")
        manejar_comandos(nombre_usuario, nombre_sala)

      ["/exit"] ->
        send(@servicio_remoto, {:desconectar, nombre_usuario})
        IO.inspect({:desconectar, nombre_usuario}, label: "Cliente envió")
        Util.mostrar_mensaje("Saliendo del chat. Adiós!")

      _ ->
        if sala_actual do
          send(@servicio_remoto, {:mensaje_sala, sala_actual, nombre_usuario, comando})
          IO.inspect({:mensaje_sala, sala_actual, nombre_usuario, comando}, label: "Cliente envió")
        else
          Util.mostrar_error("Comando no reconocido o no estás en una sala. Escriba '/help' para ver los comandos disponibles.")
        end
        manejar_comandos(nombre_usuario, sala_actual)
    end
  end

  defp mostrar_comandos() do
    Util.mostrar_mensaje("""
    /nComandos disponibles:
    /list → Mostrar usuarios conectados.
    /join nombre_sala → Unirse a una sala de chat.
    /create nombre_sala → Crear una nueva sala de chat.
    /exit → Salir del chat.
    """)
  end

  defp recibir_respuestas(nombre_usuario, sala_actual) do
    receive do
      {:registro_exitoso, _} ->
        IO.inspect({:registro_exitoso}, label: "Cliente recibió")
        Util.mostrar_mensaje("Registro exitoso en el servidor.")
        recibir_respuestas(nombre_usuario, sala_actual)

      {:usuarios_conectados, usuarios} ->
        IO.inspect({:usuarios_conectados, usuarios}, label: "Cliente recibió")
        Util.mostrar_mensaje("Usuarios conectados: #{Enum.join(usuarios, ", ")}")
        recibir_respuestas(nombre_usuario, sala_actual)

      {:sala_creada, nombre_sala} ->
        IO.inspect({:sala_creada, nombre_sala}, label: "Cliente recibió")
        Util.mostrar_mensaje("Sala #{nombre_sala} creada exitosamente.")
        recibir_respuestas(nombre_usuario, sala_actual)

      {:unido_a_sala, nombre_sala} ->
        IO.inspect({:unido_a_sala, nombre_sala}, label: "Cliente recibió")
        Util.mostrar_mensaje("Te has unido a la sala #{nombre_sala}.")
        recibir_respuestas(nombre_usuario, nombre_sala)

      {:mensaje_sala, nombre_sala, remitente, mensaje} ->
        IO.inspect({:mensaje_sala, nombre_sala, remitente, mensaje}, label: "Cliente recibió")
        Util.mostrar_mensaje("[#{nombre_sala}] #{remitente}> #{mensaje}")
        recibir_respuestas(nombre_usuario, sala_actual)

      {:error, error} ->
        IO.inspect({:error, error}, label: "Cliente recibió")
        Util.mostrar_error(error)
        recibir_respuestas(nombre_usuario, sala_actual)

      _ ->
        IO.inspect({:respuesta_no_reconocida}, label: "Cliente recibió")
        Util.mostrar_error("Respuesta no reconocida del servidor.")
        recibir_respuestas(nombre_usuario, sala_actual)
    end
  end
end

NodoCliente.main()

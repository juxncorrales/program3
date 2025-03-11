defmodule PreParcial2 do
  def main do
    nombre = Util.ingresar("Ingrese su nombre: ",:texto)
    peso = Util.ingresar("Ingrese el peso del paquete: ",:real)
    tipo_envio = seleccionar_envio()
    tarifa = aplicar_tarifa(tipo_envio,peso)
    total = total_envio(peso,tarifa)
    mensaje = generar_mensaje(nombre,tipo_envio,peso,tarifa,total)
    Util.mostrar_mensaje(mensaje)
  end

  defp seleccionar_envio do
    IO.puts("Tipos de envíos: ")
    IO.puts("1. Económico")
    IO.puts("2. Express")
    IO.puts("3. Internacional")
    opcion = Util.ingresar("Ingrese el número de la opción: ", :texto)
    case opcion do
      "1" -> "Económico"
      "2" -> "Express"
      "3" -> "Internacional"
      _ ->
        IO.puts("Opción no válida, intenta de nuevo.")
        seleccionar_envio()
    end
  end

  defp aplicar_tarifa(tipo_envio,peso) do
    cond do
      tipo_envio == "Económico" -> 5000
      tipo_envio == "Express" -> 8000
      tipo_envio == "Internacional" ->
        if peso<=5.0 do
          15000
        else
          12000
      end
    end
  end

  defp total_envio(peso,tarifa) do
    peso*tarifa
  end

  defp generar_mensaje(nombre,tipo_envio,peso,tarifa,total) do
    "El nombre del cliente es: #{nombre}, el tipo de envio es #{tipo_envio}, se aplicara la siguiente tarifa #{tarifa} * #{peso}, total = #{total}"
  end
end

PreParcial2.main()

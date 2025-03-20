defmodule PreParcial6 do
  def main do
    placa = Util.ingresar("Ingrese la placa: ",:texto)
    tipo = tipo_vehiculo()
    peso = Util.ingresar("Ingrese el peso: ",:real)
    tarifa = asignar_tarifa(tipo,peso)
    mensaje = generar_mensaje(placa,tipo,tarifa)
    Util.mostrar_mensaje(mensaje)
  end

  defp tipo_vehiculo() do
    IO.puts("Tipos de vehiculos: \n1. Carro\n2. Moto\n3. Camion")
    opcion = Util.ingresar("Ingrese el número de la opción: ", :texto)
    case opcion do
      "1" -> "Carro"
      "2" -> "Moto"
      "3" -> "Camion"
      _ ->
        IO.puts("Ingrese una opcion valida")
        tipo_vehiculo()
    end
  end

  defp asignar_tarifa(tipo,peso) do
    cond do
      tipo == "Carro" -> 10000
      tipo == "Moto" -> 5000
      tipo == "Camion" -> 20000+(2000*peso)
      true -> "Tipo de vehículo no válido"
    end
  end

  defp generar_mensaje(placa,tipo,tarifa) do
    "Vehículo #{placa} (#{tipo}) debe pagar $#{tarifa}"
  end
end

PreParcial6.main()

#Un sistema de peajes debe registrar información de los vehículos que pasan. Se solicita:
#1. Ingresar la placa del vehículo (texto).
#2. Ingresar el tipo de vehículo (Carro, Moto, Camión) (texto).
#3. Ingresar el peso del vehículo en toneladas (real).
#4. Asignar una tarifa según el tipo de vehículo:
#○ Carro: $10,000
#○ Moto: $5,000
#○ Camión: $20,000 + $2,000 por tonelada adicional.
#5. Retornar una la placa del vehículo, el tipo y total a pagar
#Ejemplo de Entrada y Salida
#Ingrese la placa del vehículo: ABC123
#Ingrese el tipo de vehículo: Camión
#Ingrese el peso del vehículo (toneladas): 5.0
#Vehículo ABC123 (Camión) debe pagar $30,000

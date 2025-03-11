defmodule PreParcial4 do
  def main do
    nombre = Util.ingresar("Ingrese el nombre del usuario: ",:texto)
    temperatura = Util.ingresar("Ingrese la temperatura en Celsius: ",:real)
    fahrenheit = convertir_a_fahrenheit(temperatura)
    kelvin = convertir_a_kelvin(temperatura)
    mensaje = generar_mensaje(nombre,fahrenheit,kelvin)
    Util.mostrar_mensaje(mensaje)
  end

  defp convertir_a_fahrenheit(temperatura) do
    (temperatura*(9/5))+32
  end

  defp convertir_a_kelvin(temperatura) do
    temperatura+273.15
  end

  defp generar_mensaje(nombre, fahrenheit, kelvin) do
    "#{nombre}, la temperatura es:\n-> #{fahrenheit}°F\n-> #{kelvin}°K"
  end

end

PreParcial4.main()

defmodule ClasificacionNumeros do
  def main do
    num = Util.ingresar("Ingrese un numero: ",:entero)
    divisible = divisibilidad(num)
    mensaje = generar_mensaje(num,divisible)
    Util.mostrar_mensaje(mensaje)
  end

  defp divisibilidad(num) do
    cond do
      rem(num, 2) == 0 and rem(num, 3) == 0 -> "es divisible por 2 y 3"
      rem(num, 2) == 0 -> "es divisible por 2"
      rem(num, 3) == 0 -> "es divisible por 3"
      true -> "no es divisible por 2 ni 3"
    end
  end

  defp generar_mensaje(num,divisible) do
    "El numero #{num} #{divisible}"
  end
end

ClasificacionNumeros.main()

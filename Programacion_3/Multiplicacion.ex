defmodule Multiplicacion do
  def main do
    "Ingrese el numero del cual desea saber la tabla de multiplicar: "
    |>Util.ingresar(:entero)
    |>generar_tabla()
  end

  def generar_tabla(numero) do
    Enum.map(1..10, fn i -> IO.puts("#{numero} x #{i} = #{numero * i}") end)
  end
end

Multiplicacion.main()

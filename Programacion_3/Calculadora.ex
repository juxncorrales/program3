defmodule Calculadora do
  def suma(a,b) do
    "Se van a sumar los valores #{a} y #{b}"
    |>IO.puts()
    a+b
  end
  def resta(a,b) do
    "Se van a restar los valores #{a} y #{b}"
    |>IO.puts()
    a-b
  end
  def multiplicacion(a,b) do
    "Se van a multiplicar los valores #{a} y #{b}"
    |>IO.puts()
    a*b
  end
  def division(a,b) do
    "Se van a dividir los valores #{a} y #{b}"
    |>IO.puts()
    a/b
  end
end
IO.inspect Calculadora.suma(5,6)
IO.inspect Calculadora.resta(5,6)
IO.inspect Calculadora.multiplicacion(5,6)
IO.inspect Calculadora.division(5,6)

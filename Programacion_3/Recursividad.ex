defmodule RecursionExamples do
  # Serie de Fibonacci
  def fibonacci(0), do: 0
  def fibonacci(1), do: 1
  def fibonacci(n) when n > 1, do: fibonacci(n - 1) + fibonacci(n - 2)

  # Números triangulares
  def triangular(0), do: 0
  def triangular(n) when n > 1, do: n + triangular(n - 1)

  # Factorial
  def factorial(0), do: 1
  def factorial(n) when n > 1, do: n * factorial(n - 1)

  # Números pares
  def pares(1), do: 2
  def pares(n) when n > 1, do: 2 + pares(n - 1)

  # Números impares

  def impares(1), do: 1  #(CASO BASE) Primer numero impar
  def impares(n) when n > 1, do: 2 + impares(n - 1)

  #impares(4) = 2 + impares(3)
  #impares(3) = 2 + impares(2)
  #impares(2) = 2 + impares(1)
  #impares(1) = 1  (Caso base)

  #impares(2) = 2 + 1 = 3
  #impares(3) = 2 + 3 = 5
  #impares(4) = 2 + 5 = 7

  # Cuadrados de un número
  def cuadrados(1), do: 1
  def cuadrados(n) when n > 1, do: n * n

  # Serie de Padovan
  def padovan(0), do: 1
  def padovan(1), do: 1
  def padovan(2), do: 1
  def padovan(n) when n > 2, do: padovan(n - 2) + padovan(n - 3)

  # Serie de Lucas
  def lucas(0), do: 2
  def lucas(1), do: 1
  def lucas(n) when n > 1, do: lucas(n - 1) + lucas(n - 2)

  # Suma de los primeros n números naturales
  def suma_n(0), do: 0
  def suma_n(n) when n > 1, do: n + suma_n(n - 1)

  # Producto de los primeros n números naturales
  def producto_n(1), do: 1
  def producto_n(n) when n > 1, do: n * producto_n(n - 1)

  # Suma de los dígitos de un número
  def suma_digitos(0), do: 0
  def suma_digitos(n) when n > 0, do: rem(n, 10) + suma_digitos(div(n, 10))

end

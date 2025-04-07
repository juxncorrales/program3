defmodule NumerosPares do
  def pares(1), do: 2
  def pares(n) when n > 0, do: 2 + pares(n - 1)
end

IO.puts NumerosPares.pares(10)

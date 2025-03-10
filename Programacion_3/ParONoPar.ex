defmodule ParONoPar do
  def main do
    Enum.map(1..10, fn x -> if rem(x, 2) == 0 do IO.puts("#{x} es par") else IO.puts("#{x} es impar") end end)
  end
end
ParONoPar.main()

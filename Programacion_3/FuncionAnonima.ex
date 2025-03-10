defmodule Calculo do
  def operar(func) do
    func.(5,3)
  end
end
resta = fn a,b -> a-d end
IO.puts Calculo.operar(resta)

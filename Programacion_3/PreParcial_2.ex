defmodule ListaEjercicios do
    def suma(lista) do
        Enum.reduce(lista,0,fn x, acc -> x + acc end)
    end
    def max([head|tail]) do
        Enum.reduce(tail,head,fn x, acc -> if x > acc, do: x, else: acc end)
    end
    def contar(lista), do: contar_rec(lista,0)
    defp contar_rec([],acc), do: acc
    defp contar_rec([_|tail],acc), do: contar_rec(tail,acc + 1)
end
IO.puts ListaEjercicios.suma([1,2,3,4])
IO.puts ListaEjercicios.max([3,8,2,5])
IO.puts ListaEjercicios.contar([1,2,3,4,5])

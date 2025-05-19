defmodule TareasConcurrentes do
  def principal(matriz) do
    t1 = Task.async(fn -> calcular_suma_debajo_diagonal(matriz) end)
    t2 = Task.async(fn -> calcular_promedio_encima_diagonal(matriz) end)
    a = Task.await(t1)
    b = Task.await(t2)
    c = a * b
    IO.puts("Resultado (c): #{c}")
  end

  defp calcular_suma_debajo_diagonal(matriz) do
    calcular_suma_debajo_diagonal(matriz, 0, 0)
  end

  defp calcular_suma_debajo_diagonal([], _, suma), do: suma

  defp calcular_suma_debajo_diagonal([fila | resto], indice_fila, suma) do
    nueva_suma =
      fila
      |> Enum.with_index()
      |> Enum.reduce(suma, fn {valor, indice_columna}, acc ->
        if indice_columna < indice_fila, do: acc + valor, else: acc
      end)

    calcular_suma_debajo_diagonal(resto, indice_fila + 1, nueva_suma)
  end

  defp calcular_promedio_encima_diagonal(matriz) do
    {suma, conteo} = calcular_suma_y_conteo_encima_diagonal(matriz, 0, 0, {0, 0})
    suma / conteo
  end

  defp calcular_suma_y_conteo_encima_diagonal([], _, _, {suma, conteo}), do: {suma, conteo}

  defp calcular_suma_y_conteo_encima_diagonal([fila | resto], indice_fila, _, {suma, conteo}) do
    {nueva_suma, nuevo_conteo} =
      fila
      |> Enum.with_index()
      |> Enum.reduce({suma, conteo}, fn {valor, indice_columna}, {acc_suma, acc_conteo} ->
        if indice_columna > indice_fila, do: {acc_suma + valor, acc_conteo + 1}, else: {acc_suma, acc_conteo}
      end)

    calcular_suma_y_conteo_encima_diagonal(resto, indice_fila + 1, 0, {nueva_suma, nuevo_conteo})
  end
end

TareasConcurrentes.principal([
  [1, 2, 3],
  [4, 5, 6],
  [7, 8, 9]
])

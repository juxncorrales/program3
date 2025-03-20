defmodule SeguimientoEstructuras do
  def main do
    IO.puts("1. Ejercicios con Listas")
    IO.puts("2. Ejercicios con Tuplas")
    IO.puts("3. Ejercicios con Listas de Palabras Clave")
    IO.puts("4. Ejercicios con Mapas")
    opcion = Util.ingresar("Ingrese el número de la opción: ", :texto)
    case opcion do
      "1" -> mostrar_ejercicios_con_listas()
      "2" -> mostrar_ejercicios_con_tuplas()
      "3" -> mostrar_ejercicios_con_listas_de_palabras_clave()
      "4" -> mostrar_ejercicios_con_mapas()
      end
  end

  #******************************************************************************
  #                           Ejercicios con Listas
  #******************************************************************************

  defp mostrar_ejercicios_con_listas() do
    IO.puts("*********************")
    IO.puts("Ejercicios con Listas")
    IO.puts("*********************\n")
    IO.puts("********************")
    IO.puts("1. Suma de elementos")
    IO.puts("********************")
    suma_de_elementos()
    IO.puts("************************")
    IO.puts("2. Filtrar numeros pares")
    IO.puts("************************")
    filtrar_numeros_pares()
    IO.puts("**********************************")
    IO.puts("3. Multiplicar cada elemento por 3")
    IO.puts("**********************************")
    multiplicar_cada_elemento_por_3()
    IO.puts("********************")
    IO.puts("4. Concatenar listas")
    IO.puts("********************")
    concatenar_listas()
  end

  # 1. Escribe una función que sume todos los elementos de una lista.

  defp suma_de_elementos() do
    lista = [1,2,3,4,5]
    Enum.reduce(lista,0,fn x, acc -> x + acc end)
    |>IO.puts()
  end

  # 2. Escribe una función que reciba una lista de números y retorne solo los pares.

  defp filtrar_numeros_pares() do
    lista = [1,2,3,4,5,6,7,8,9,10]
    Enum.map(lista,fn x -> if rem(x, 2) == 0 do IO.puts(x)end end)
  end

  # 3. Escribe una función que multiplique cada elemento de una lista por 3 usando

  defp multiplicar_cada_elemento_por_3() do
    lista = [1,2,3,4,5]
    Enum.map(lista,fn x -> IO.puts(x*3) end)
  end

  # 4. Une dos listas en una sola sin usar ++.

  defp concatenar_listas() do
    lista_1 = [1,2,3,4,5]
    lista_2 = [6,7,8,9,10]
    Enum.concat(lista_1, lista_2)
    |>IO.inspect()
  end

  #******************************************************************************
  #                           Ejercicios con Tuplas
  #******************************************************************************

  defp mostrar_ejercicios_con_tuplas() do
    IO.puts("*********************")
    IO.puts("Ejercicios con Tuplas")
    IO.puts("*********************\n")
    IO.puts("******************")
    IO.puts("1. Extraer valores")
    IO.puts("******************")
    extraer_valores()
    IO.puts("*************************")
    IO.puts("2. Intercambiar elementos")
    IO.puts("*************************")
    intercambiar_elementos({"hola", "mundo"})
    IO.puts("*********************")
    IO.puts("3. Actualizar valores")
    IO.puts("*********************")
    actualizar_valores()
    IO.puts("****************************")
    IO.puts("4. Tupla dentro de una lista")
    IO.puts("****************************")
    tupla_dentro_de_una_lista()
  end

  # 1. Dada la tupla {:ok, "Exito", 200}, extrae y muestra cada elemento por separado.

  defp extraer_valores()do
    tupla = {:ok, "Éxito", 200}
    IO.inspect(elem(tupla, 0))
    IO.inspect(elem(tupla, 1))
    IO.inspect(elem(tupla, 2))
  end

  # 2. Crea una función que reciba {a, b} y devuelva {b, a}.

  defp intercambiar_elementos({a,b}) do
    {b,a}
    |>IO.inspect()

  end

  # 3. Dada la tupla {"Pepito", 30, "Bogotá"}, cambia la edad a 31.

  defp actualizar_valores() do
    tupla = {"Pepito", 30, "Bogotá"}
    nueva_tupla = put_elem(tupla, 1, 31)
    IO.inspect(nueva_tupla)
  end

  # 4. Crea una lista de tuplas con nombres y edades de 3 personas.

  defp tupla_dentro_de_una_lista() do
    tupla_1 = {"Ana", 25}
    tupla_2 = {"Carlos", 30}
    tupla_3 = {"Beatriz", 28}
    lista = [tupla_1,tupla_2,tupla_3]
    IO.inspect(lista)
  end

  #******************************************************************************
  #                    Ejercicios con Listas de Palabras Clave
  #******************************************************************************

  defp mostrar_ejercicios_con_listas_de_palabras_clave() do
    IO.puts("***************************************")
    IO.puts("Ejercicios con Listas de Palabras Clave")
    IO.puts("***************************************\n")
    IO.puts("*********************")
    IO.puts("1. Acceder a un valor")
    IO.puts("*********************")
    acceder_a_un_valor()
    IO.puts("**********************")
    IO.puts("1. Actualizar un valor")
    IO.puts("**********************")
    actualizar_un_valor()
  end

  # 1. Dada la lista [modo: :rapido, tiempo: 10, activo: true], obtén el valor de :tiempo.

  defp acceder_a_un_valor() do
    lista = [modo: :rapido, tiempo: 10, activo: true]
    IO.inspect(Keyword.get(lista, :tiempo))
  end

  # 2. Dada la lista [modo: :seguro, nivel: 3], cambia :nivel a 5.

  defp actualizar_un_valor() do
    lista = [modo: :seguro, nivel: 3]
    nueva_lista = Keyword.put(lista, :nivel, 5)
    IO.inspect(nueva_lista)
  end

  defp mostrar_ejercicios_con_mapas() do

  end
end


SeguimientoEstructuras.main()

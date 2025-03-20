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
    IO.puts("\n*********************")
    IO.puts("Ejercicios con Listas")
    IO.puts("*********************")
    IO.puts("\n********************")
    IO.puts("1. Suma de elementos")
    IO.puts("********************\n")
    suma_de_elementos()
    IO.puts("\n************************")
    IO.puts("2. Filtrar numeros pares")
    IO.puts("************************\n")
    filtrar_numeros_pares()
    IO.puts("\n**********************************")
    IO.puts("3. Multiplicar cada elemento por 3")
    IO.puts("**********************************\n")
    multiplicar_cada_elemento_por_3()
    IO.puts("\n********************")
    IO.puts("4. Concatenar listas")
    IO.puts("********************\n")
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
    IO.puts("\n*********************")
    IO.puts("Ejercicios con Tuplas")
    IO.puts("*********************")
    IO.puts("\n******************")
    IO.puts("1. Extraer valores")
    IO.puts("******************\n")
    extraer_valores()
    IO.puts("\n*************************")
    IO.puts("2. Intercambiar elementos")
    IO.puts("*************************\n")
    intercambiar_elementos({"hola", "mundo"})
    IO.puts("\n*********************")
    IO.puts("3. Actualizar valores")
    IO.puts("*********************\n")
    actualizar_valores()
    IO.puts("\n****************************")
    IO.puts("4. Tupla dentro de una lista")
    IO.puts("****************************\n")
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
    IO.puts("\n***************************************")
    IO.puts("Ejercicios con Listas de Palabras Clave")
    IO.puts("***************************************")
    IO.puts("\n*********************")
    IO.puts("1. Acceder a un valor")
    IO.puts("*********************\n")
    acceder_a_un_valor()
    IO.puts("\n**********************")
    IO.puts("2. Actualizar un valor")
    IO.puts("**********************\n")
    actualizar_un_valor()
    IO.puts("\n********************")
    IO.puts("3. Convertrir a mapa")
    IO.puts("********************\n")
    convertir_a_mapa()
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

  # 3. Transforma [nombre: "Pepito", edad: 30, ciudad: "Bogotá"] en un mapa.

  defp convertir_a_mapa() do
    lista = [nombre: "Pepito", edad: 30, ciudad: "Bogotá"]
    mapa = Map.new(lista)
    IO.inspect(mapa)
  end

  #******************************************************************************
  #                           Ejercicios con Mapas
  #******************************************************************************

  defp mostrar_ejercicios_con_mapas() do
    IO.puts("\n********************")
    IO.puts("Ejercicios con Mapas")
    IO.puts("********************")
    IO.puts("\n********************")
    IO.puts("1. Agregar una clave")
    IO.puts("********************\n")
    agregar_una_clave()
    IO.puts("\n*********************")
    IO.puts("2. Actualizar valores")
    IO.puts("*********************\n")
    actualizar_valores_mapas()
    IO.puts("\n*********************")
    IO.puts("3. Acceder a un valor")
    IO.puts("*********************\n")
    acceder_a_un_valor_mapas()
    IO.puts("\n*********************")
    IO.puts("4. Fusionar dos mapas")
    IO.puts("*********************\n")
    fusionar_dos_mapas()
  end

  # 1. Dado %{nombre: "Pepito", edad: 30}, agrega ciudad: "Bogotá".

  defp agregar_una_clave() do
    mapa = %{nombre: "Pepito", edad: 30}
    mapa_nuevo = Map.put(mapa,:ciudad,"Bogotá")
    IO.inspect(mapa_nuevo)
  end

  # 2. Dado %{nombre: "Pepito", edad: 30}, incrementa edad en 1 usando Map.update/3.

  defp actualizar_valores_mapas() do
    mapa = %{nombre: "Pepito", edad: 30}
    mapa = Map.update(mapa,:edad,31, fn edad -> edad + 1 end)
    IO.inspect(mapa)
  end

  # 3. Extrae el valor de :nombre en %{nombre: "Pepito", ciudad: "Bogotá"}.

  defp acceder_a_un_valor_mapas() do
    mapa = %{nombre: "Pepito", ciudad: "Bogotá"}
    Map.get(mapa,:nombre)
    |>IO.inspect()
  end

  # 4. Une %{nombre: "Pepito"} con %{edad: 30, ciudad: "Bogotá"}.

  defp fusionar_dos_mapas() do
    mapa_1 = %{nombre: "Pepito"}
    mapa_2 = %{edad: 30, ciudad: "Bogotá"}
    mapa_nuevo = Map.merge(mapa_1,mapa_2)
    IO.inspect(mapa_nuevo)
  end
end

SeguimientoEstructuras.main()

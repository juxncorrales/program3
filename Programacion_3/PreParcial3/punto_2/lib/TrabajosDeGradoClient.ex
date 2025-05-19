defmodule TrabajosDeGradoClient do
  # Función para iniciar el cliente
  def start do
    # Conectar al nodo del servidor
    IO.puts("Conectando al servidor...")
    Node.connect(:"server@localhost")

    # Solicitar la lista de trabajos de grado
    trabajos = TrabajosDeGradoServer.listar_trabajos()

    IO.puts("Lista de Trabajos de Grado:")
    Enum.each(trabajos, fn trabajo ->
      IO.puts("#{trabajo.id}. #{trabajo.titulo} - #{trabajo.descripcion}")
    end)

    # Permitir al usuario seleccionar un trabajo
    IO.puts("\nSeleccione un trabajo por ID:")
    id = String.to_integer(IO.gets("") |> String.trim())

    # Consultar los autores del trabajo seleccionado
    case TrabajosDeGradoServer.consultar_autores(id) do
      :error -> IO.puts("Trabajo no encontrado.")
      autores ->
        IO.puts("\nAutores del Trabajo:")
        Enum.each(autores, fn autor ->
          IO.puts("#{autor.nombre} #{autor.apellidos} - #{autor.programa} (#{autor.titulo})")
        end)
    end
  end
end

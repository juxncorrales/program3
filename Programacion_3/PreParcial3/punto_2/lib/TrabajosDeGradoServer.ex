defmodule TrabajosDeGradoServer do
  use GenServer

  # Inicia el servidor con datos precargados
  def start_link(_) do
    GenServer.start_link(__MODULE__, %{}, name: __MODULE__)
  end

  def init(_) do
    trabajos = [
      %{id: 1, fecha: ~D[2025-05-01], titulo: "Sistema de Gestión", descripcion: "Un sistema para gestionar recursos.", autores: [123, 456]},
      %{id: 2, fecha: ~D[2025-04-15], titulo: "App de Salud", descripcion: "Aplicación para monitorear la salud.", autores: [789, 456]},
      %{id: 3, fecha: ~D[2025-03-20], titulo: "Plataforma Educativa", descripcion: "Plataforma para cursos en línea.", autores: [123, 789]}
    ]

    autores = [
      %{cedula: 123, nombre: "Juan", apellidos: "Perez", programa: "Ingeniería", titulo: "Ingeniero"},
      %{cedula: 456, nombre: "Ana", apellidos: "Gomez", programa: "Medicina", titulo: "Doctora"},
      %{cedula: 789, nombre: "Luis", apellidos: "Martinez", programa: "Educación", titulo: "Licenciado"}
    ]

    {:ok, %{trabajos: trabajos, autores: autores}}
  end

  # Obtener la lista completa de trabajos de grado
  def handle_call(:listar_trabajos, _from, state) do
    {:reply, state.trabajos, state}
  end

  # Consultar los autores de un trabajo específico
  def handle_call({:consultar_autores, id}, _from, state) do
    case Enum.find(state.trabajos, fn trabajo -> trabajo.id == id end) do
      nil -> {:reply, :error, state}
      trabajo ->
        autores = Enum.filter(state.autores, fn autor -> autor.cedula in trabajo.autores end)
        {:reply, autores, state}
    end
  end

  # API pública para listar trabajos
  def listar_trabajos do
    GenServer.call(__MODULE__, :listar_trabajos)
  end

  # API pública para consultar autores
  def consultar_autores(id) do
    GenServer.call(__MODULE__, {:consultar_autores, id})
  end
end

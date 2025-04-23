defmodule Estructuras do
  def main do
    "Docentes_Uniquindio.csv"
    |>Docente.leer_csv()
    |>filtrar_datos_interes()
    |>Docente.generar_mensaje(&generar_mensaje/1)
    |>Util.mostrar_mensaje()
  end

  defp filtrar_datos_interes(datos) do
    datos
    |>Enum.filter( fn (docente) -> docente.formacion == "MAESTRIA" and docente.vinculacion == "PLANTA" end)
  end

  def generar_mensaje(docente) do
    "Periodo: #{docente.periodo},Formacio: #{docente.formacion},Vinculacion: #{docente.vinculacion}"
  end
end

Estructuras.main

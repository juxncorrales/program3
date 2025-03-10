defmodule Util do
  def mostrar_mensaje(mensaje) do
    IO.puts("#{mensaje}")
  end

  def ingresar(mensaje,:texto) do
    mensaje
    |>IO.gets()
    |>String.trim()
  end

  def ingresar(mensaje,:entero) do
    mensaje
    |>Util.ingresar(:texto)
    |>String.to_integer()
  end

  def ingresar(mensaje,:real) do
    mensaje
    |>Util.ingresar(:texto)
    |>String.to_float()
  rescue
    ArgumentError->
      "error, se espera que ingrese un numero real\n"
      |> mostrar_mensaje()

      mensaje
      |>ingresar(:real)

    end

  def ingresar_texto(mensaje) do
    mensaje
    |> IO.gets()
    |> String.trim()
  end

  def generar_mensaje(nombre) do
    "Bienvenido #{nombre} a la empresa Once Ltda"
  end
end

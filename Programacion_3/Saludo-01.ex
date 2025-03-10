############################################
#             Primeras pruebas
############################################
defmodule Mensaje do

  def mostrar_mensaje(mensaje) do
    IO.puts(mensaje)
  end

  def main do
    Mensaje.mostrar_mensaje("Hola mundo")
  end

end

Mensaje.main()
############################################

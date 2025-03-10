defmodule Mensaje do
  def main do
    "Ingrese nombre del empleado: "
    |> Util.ingresar_texto()
    |> Util.generar_mensaje()
    |> Util.mostrar_mensaje()
  end
end

Mensaje.main()

defmodule DatosLogicos do
  def main do
    "Ingrese la antigüedad del cliente: "
    |> Util.ingresar(:entero)
    |> antiguedad()
    |> generar_mensaje()
    |> Util.mostrar_mensaje()
  end

  defp antiguedad(años) do
    if años >= 1 and años <= 2 do
      "10%"
    else
      if años >= 3 and años <= 6 do
        "14%"
      else
        if años > 6 do
          "17%"
        else
          "0%"
        end
      end
    end
  end

  defp generar_mensaje(porcentaje) do
    "El descuento es de #{porcentaje}"
  end
end

DatosLogicos.main()

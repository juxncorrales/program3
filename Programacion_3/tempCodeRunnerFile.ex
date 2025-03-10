defmodule EntradaEnteros do
  def main do
    valor_total = "Ingrese el valor total de la factura: "
    |>ingresar(:entero)

    valor_entregado = "Ingrese el valor entregado por el cliente: "
    |>ingresar(:entero)

    devuelta = calcular_devuelta(valor_entregado,valor_total)

    devuelta
    |>generar_mensaje()
    |>Util.mostrar_mensaje()
  end

  defp ingresar(mensaje, :entero) do
    mensaje
    |>Util.ingresar_texto(:texto)
    |>String.to_integer()
  end

  defp calcular_devuelta(valor_entregado,valor_total) do
    valor_total - valor_entregado
  end

  defp generar_mensaje(devuelta) do
    "El valor de devuelta es $#{devuelta}"
  end
end
EntradaEnteros.main()

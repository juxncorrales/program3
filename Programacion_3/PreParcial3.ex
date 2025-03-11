defmodule PreParcial3 do
  def main do
    nombre = Util.ingresar("Ingrese el nombre del medicamento: ",:texto)
    cantidad = Util.ingresar("Ingrese la cantidad de unidades: ",:entero)
    precio = Util.ingresar("Ingrese el precio por unidad: ",:real)
    valor = calcular_valor(cantidad,precio)
    mensaje = generar_mensaje(nombre,cantidad,valor)
    Util.mostrar_mensaje(mensaje)
  end

  defp calcular_valor(cantidad,precio) do
    cantidad*precio
  end

  defp generar_mensaje(nombre,cantidad,valor) do
    "El medicamento #{nombre} tiene #{cantidad} unidades disponibles, con un valor total de $#{valor}"
  end
end

PreParcial3.main()

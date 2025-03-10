defmodule PreParcial1 do
  def main do
    nombre = Util.ingresar("Ingrese su nombre: ",:texto)
    kilometros = Util.ingresar("Ingrese la distancia en kilometros: ",:real)
    combustible = Util.ingresar("Ingrese la cantidad de combustible consumido en litros: ",:real)
    rendimiento = calcular_rendimiento(kilometros,combustible)
    mensaje = generar_mensaje(nombre,rendimiento)
    Util.mostrar_mensaje(mensaje)
  end

  def calcular_rendimiento(kilometros,combustible) do
    kilometros/combustible
  end

  def generar_mensaje(nombre,rendimiento) do
    "El conductor #{nombre} tuvo un rendimiento de #{rendimiento}Km/L"
  end
end

PreParcial1.main()

defmodule PreParcial5 do
  def main do
    nombre = Util.ingresar("Ingrese su nombre: ",:texto)
    base = Util.ingresar("Ingrese su salario base: ",:real)
    extras = Util.ingresar("Ingrese el numero de horas extras trabajadas: ",:entero)
    salario = calcular_salario(base,extras)
    mensaje = generar_mensaje(nombre,salario)
    Util.mostrar_mensaje(mensaje)
  end

  defp calcular_salario(base,extras) do
    (((base/46)*1.5)*extras)+base
  end

  defp generar_mensaje(nombre,salario) do
    "El salario total de #{nombre} es de $#{salario}"
  end
end

PreParcial5.main()

#Una empresa necesita calcular el salario total de un empleado. El programa debe:
#1. Pedir el nombre del empleado (texto).
#2. Ingresar el salario base (real).
#3. Ingresar el número de horas extras trabajadas (entero).
#4. Cada hora extra se paga al 1.5x del valor de una hora normal. (46 hrs mensuales)
#5. Mostrar el salario total del empleado.
#Ejemplo de entrada y salida:
#Ingrese el nombre del empleado: María Gómez
#Ingrese el salario base: 1500000
#Ingrese las horas extras trabajadas: 5
#El salario total de María Gómez es de $1,744,565.

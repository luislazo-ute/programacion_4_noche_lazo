// Enunciado
// Una carpintería registra la cantidad de muebles fabricados por cada trabajador durante la jornada laboral.
// Realiza un programa en Dart que use readLineSync() y un ciclo while para ingresar la cantidad de muebles elaborados por empleado.
// Reglas de negocio:
// Menos de 3 muebles → “Producción baja”
// Entre 3 y 7 muebles → “Producción normal”
// Más de 7 muebles → “Producción alta”
// El programa debe continuar solicitando datos mientras se ingresen valores mayores a 0.
// Cuando el usuario ingrese 0, mostrar:
// Total de muebles fabricados
// Cantidad de trabajadores registrados
// Promedio de muebles por trabajador




import 'dart:io';

void main() {
  int totalMuebles = 0;
  int cantidadTrabajadores = 0;

  print("Producción de la carpintería");

  print("Ingrese la cantidad de muebles fabricados:");
  int muebles = int.parse(stdin.readLineSync()!);

  while (muebles > 0) {
    if (muebles < 3) {
      print("Producción baja");
    } else if (muebles <= 7) {
      print("Producción normal");
    } else {
      print("Producción alta");
    }

    totalMuebles = totalMuebles + muebles;
    cantidadTrabajadores = cantidadTrabajadores + 1;

    print("\nIngrese la cantidad de muebles fabricados por el siguiente trabajador:");
    print("Ingrese 0 para terminar:");
    muebles = int.parse(stdin.readLineSync()!);
  }

  print("\nResumen");
  print("Total de muebles fabricados: $totalMuebles");
  print("Cantidad de trabajadores registrados: $cantidadTrabajadores");

  if (cantidadTrabajadores > 0) {
    double promedio = totalMuebles / cantidadTrabajadores;
    print("Promedio de muebles por trabajador: ${promedio.toStringAsFixed(2)}");
  } else {
    print("Promedio de muebles por trabajador: 0");
  }
}
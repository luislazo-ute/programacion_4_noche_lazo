// Enunciado
// Un taller de carpintería controla la cantidad de tablas cortadas por cada operario durante el día.
// Realiza un programa en Dart que use readLineSync() y un ciclo while para ingresar la cantidad de tablas cortadas por trabajador.
// Reglas de negocio:
// Menos de 15 tablas → “Trabajo lento”
// Entre 15 y 40 tablas → “Trabajo eficiente”
// Más de 40 tablas → “Trabajo sobresaliente”
// El programa debe seguir solicitando datos mientras se ingresen valores mayores a 0.
// Cuando el usuario ingrese 0, mostrar:
// Total de tablas cortadas
// Cantidad de operarios registrados
// Promedio de tablas por operario

import 'dart:io';

void main() {
  int totalTablas = 0;
  int cantidadOperarios = 0;

  print("Tablas cortadas");

  print("Ingrese la cantidad de tablas cortadas :");
  int tablas = int.parse(stdin.readLineSync()!);

  while (tablas > 0) {
    if (tablas < 15) {
      print("Trabajo lento");
    } else if (tablas <= 40) {
      print("Trabajo eficiente");
    } else {
      print("Trabajo sobresaliente");
    }

    totalTablas = totalTablas + tablas;
    cantidadOperarios = cantidadOperarios + 1;

    print("\nIngrese la cantidad de tablas cortadas por el siguiente operario:");
    print("Ingrese 0 para terminar:");
    tablas = int.parse(stdin.readLineSync()!);
  }

  print("\nResumen");
  print("Total de tablas cortadas: $totalTablas");
  print("Cantidad de operarios registrados: $cantidadOperarios");

  if (cantidadOperarios > 0) {
    double promedio = totalTablas / cantidadOperarios;
    print("Promedio de tablas por operario: ${promedio.toStringAsFixed(2)}");
  } else {
    print("Promedio de tablas por operario: 0");
  }
}
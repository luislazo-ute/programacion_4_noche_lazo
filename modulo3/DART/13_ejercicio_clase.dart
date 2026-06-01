// Enunciado
// Un gimnasio registra la cantidad de minutos que cada cliente entrenó durante el día.
// Realiza un programa en Dart que use readLineSync() y un ciclo while para ingresar los minutos de entrenamiento de cada cliente.
// Reglas de negocio:
// Menos de 30 minutos → “Entrenamiento insuficiente”
// Entre 30 y 90 minutos → “Entrenamiento adecuado”
// Más de 90 minutos → “Entrenamiento intenso”
// El programa debe seguir solicitando datos mientras se ingresen valores mayores a 0.
// Cuando el usuario ingrese 0, mostrar:
// Total de minutos entrenados
// Cantidad de clientes registrados
// Promedio de minutos por cliente

import 'dart:io';

void main() {
  int totalMinutos = 0;
  int cantidadClientes = 0;

  print("Entrenamiento gimnasio");

  print("Ingrese los minutos entrenados por el cliente:");
  int minutos = int.parse(stdin.readLineSync()!);

  while (minutos > 0) {
    if (minutos < 30) {
      print("Entrenamiento insuficiente");
    } else if (minutos <= 90) {
      print("Entrenamiento adecuado");
    } else {
      print("Entrenamiento intenso");
    }

    totalMinutos = totalMinutos + minutos;
    cantidadClientes = cantidadClientes + 1;

    print("\nIngrese los minutos entrenados por el siguiente cliente:");
    print("Ingrese 0 para terminar:");
    minutos = int.parse(stdin.readLineSync()!);
  }

  print("\nResumen");
  print("Total de minutos entrenados: $totalMinutos");
  print("Cantidad de clientes registrados: $cantidadClientes");

  if (cantidadClientes > 0) {
    double promedio = totalMinutos / cantidadClientes;
    print("Promedio de minutos por cliente: ${promedio.toStringAsFixed(2)}");
  } else {
    print("Promedio de minutos por cliente: 0");
  }
}
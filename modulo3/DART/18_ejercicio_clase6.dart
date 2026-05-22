// Enunciado 1
// Un almacén registra las ventas diarias de productos durante una semana para cada vendedor.
// Realiza un programa en Dart que use readLineSync() y un ciclo for para ingresar las ventas de 7 días por cada vendedor.
// Dentro del ciclo, calcular:
// Total de ventas por vendedor
// Promedio diario de ventas
// Reglas de negocio:
// Menos de 10 ventas diarias → “Bajo rendimiento”
// Entre 10 y 25 ventas diarias → “Rendimiento normal”
// Más de 25 ventas diarias → “Alto rendimiento”
// Al finalizar cada vendedor, mostrar:
// Total de ventas
// Promedio de ventas
// Clasificación de rendimiento

import 'dart:io';

void main() {
  print("Ventas semanales");

  print("Ingrese el nombre del vendedor:");
  String vendedor = stdin.readLineSync()!;

  int totalVentas = 0;

  for (int dia = 1; dia <= 7; dia++) {
    print("Ingrese las ventas del día $dia:");
    int ventas = int.parse(stdin.readLineSync()!);

    totalVentas = totalVentas + ventas;
  }

  double promedioDiario = totalVentas / 7;

  String clasificacion;

  if (promedioDiario < 10) {
    clasificacion = "Bajo rendimiento";
  } else if (promedioDiario <= 25) {
    clasificacion = "Rendimiento normal";
  } else {
    clasificacion = "Alto rendimiento";
  }

  print("\nResumen");
  print("Vendedor: $vendedor");
  print("Total de ventas: $totalVentas");
  print("Promedio diario de ventas: ${promedioDiario.toStringAsFixed(2)}");
  print("Clasificación: $clasificacion");
}
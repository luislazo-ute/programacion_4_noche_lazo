// Enunciado
// Un aeropuerto controla la operación diaria de sus agentes de embarque, registrando vuelos, pasajeros y retrasos.
// Realiza un programa en Dart que use readLineSync() y un ciclo while para ingresar por cada agente:
// Cantidad de vuelos atendidos
// Cantidad de pasajeros procesados
// Minutos totales de retraso
// Dentro del ciclo, calcular:
// Pasajeros por vuelo
// Índice de retraso por vuelo:
// [
// \text{Retraso por vuelo} = \frac{\text{Minutos de retraso}}{\text{Vuelos}}
// ]
// Reglas de negocio:
// Menos de 50 pasajeros por vuelo → “Baja eficiencia”
// Entre 50 y 120 pasajeros por vuelo → “Eficiencia normal”
// Más de 120 pasajeros por vuelo → “Alta eficiencia”
// El programa debe continuar mientras la cantidad de vuelos sea mayor a 0.
// Al finalizar, mostrar:
// Total de pasajeros procesados
// Total de minutos de retraso acumulados
// Cantidad de agentes registrados
// Promedio de pasajeros por agente
// Promedio general de retraso por vuelo

import 'dart:io';

void main() {
  int totalPasajeros = 0;
  int totalRetraso = 0;
  int cantidadAgentes = 0;
  int totalVuelos = 0;

  print("Registro agentes de embarque");

  print("Ingrese la cantidad de vuelos atendidos:");
  int vuelos = int.parse(stdin.readLineSync()!);

  while (vuelos > 0) {
    print("Ingrese la cantidad de pasajeros procesados:");
    int pasajeros = int.parse(stdin.readLineSync()!);

    print("Ingrese los minutos totales de retraso:");
    int minutosRetraso = int.parse(stdin.readLineSync()!);

    double pasajerosPorVuelo = pasajeros / vuelos;
    double retrasoPorVuelo = minutosRetraso / vuelos;

    if (pasajerosPorVuelo < 50) {
      print("Baja eficiencia");
    } else if (pasajerosPorVuelo <= 120) {
      print("Eficiencia normal");
    } else {
      print("Alta eficiencia");
    }

    print("Pasajeros por vuelo: ${pasajerosPorVuelo.toStringAsFixed(2)}");
    print("Retraso por vuelo: ${retrasoPorVuelo.toStringAsFixed(2)} minutos");

    totalPasajeros = totalPasajeros + pasajeros;
    totalRetraso = totalRetraso + minutosRetraso;
    totalVuelos = totalVuelos + vuelos;
    cantidadAgentes = cantidadAgentes + 1;

    print("\nIngrese la cantidad de vuelos atendidos por el siguiente agente:");
    print("Ingrese 0 para terminar:");
    vuelos = int.parse(stdin.readLineSync()!);
  }

  print("\nResumen del día");
  print("Total de pasajeros procesados: $totalPasajeros");
  print("Total de minutos de retraso acumulados: $totalRetraso");
  print("Cantidad de agentes registrados: $cantidadAgentes");

  if (cantidadAgentes > 0) {
    double promedioPasajerosPorAgente = totalPasajeros / cantidadAgentes;
    print("Promedio de pasajeros por agente: ${promedioPasajerosPorAgente.toStringAsFixed(2)}");
  } else {
    print("Promedio de pasajeros por agente: 0");
  }

  if (totalVuelos > 0) {
    double promedioRetrasoPorVuelo = totalRetraso / totalVuelos;
    print("Promedio general de retraso por vuelo: ${promedioRetrasoPorVuelo.toStringAsFixed(2)} minutos");
  } else {
    print("Promedio general de retraso por vuelo: 0");
  }
}
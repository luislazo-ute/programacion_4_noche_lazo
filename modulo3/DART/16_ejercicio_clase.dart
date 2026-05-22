// Enunciado
// Un consultorio médico registra la cantidad de pacientes atendidos y las horas trabajadas por cada doctor.
// Realiza un programa en Dart que use readLineSync() y un ciclo while para ingresar:
// Horas trabajadas
// Cantidad de pacientes atendidos
// Dentro del ciclo, calcular los pacientes atendidos por hora.
// Reglas de negocio:
// Menos de 3 pacientes por hora → “Atención lenta”
// Entre 3 y 6 pacientes por hora → “Atención normal”
// Más de 6 pacientes por hora → “Atención rápida”
// El programa debe continuar mientras las horas trabajadas sean mayores a 0.
// Al finalizar, mostrar:
// Total de pacientes atendidos
// Cantidad de doctores registrados
// Promedio de pacientes por doctor

import 'dart:io';

void main() {
  int totalPacientes = 0;
  int cantidadDoctores = 0;

  print("Atención del consultorio médico");

  print("Ingrese las horas trabajadas por el doctor:");
  double horas = double.parse(stdin.readLineSync()!);

  while (horas > 0) {
    print("Ingrese la cantidad de pacientes atendidos:");
    int pacientes = int.parse(stdin.readLineSync()!);

    double pacientesPorHora = pacientes / horas;

    if (pacientesPorHora < 3) {
      print("Atención lenta");
    } else if (pacientesPorHora <= 6) {
      print("Atención normal");
    } else {
      print("Atención rápida");
    }

    print("Pacientes por hora: ${pacientesPorHora.toStringAsFixed(2)}");

    totalPacientes = totalPacientes + pacientes;
    cantidadDoctores = cantidadDoctores + 1;

    print("\nIngrese las horas trabajadas por el siguiente doctor:");
    print("Ingrese 0 para terminar:");
    horas = double.parse(stdin.readLineSync()!);
  }

  print("\nResumen del día");
  print("Total de pacientes atendidos: $totalPacientes");
  print("Cantidad de doctores registrados: $cantidadDoctores");

  if (cantidadDoctores > 0) {
    double promedio = totalPacientes / cantidadDoctores;
    print("Promedio de pacientes por doctor: ${promedio.toStringAsFixed(2)}");
  } else {
    print("Promedio de pacientes por doctor: 0");
  }
}
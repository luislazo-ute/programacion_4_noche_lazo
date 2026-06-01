import 'dart:io';

void main() {
  int totalMinutos = 0;
  int estudiantes = 0;

  print('Practica diaria de idiomas');
  print('Ingrese minutos practicados:');
  int minutos = int.parse(stdin.readLineSync()!);

  while (minutos > 0) {
    if (minutos < 15) print('Practica insuficiente');
    else if (minutos <= 45) print('Practica adecuada');
    else print('Practica intensa');

    totalMinutos += minutos;
    estudiantes++;
    print('Ingrese minutos del siguiente estudiante (0 para terminar):');
    minutos = int.parse(stdin.readLineSync()!);
  }

  print('Total de minutos: $totalMinutos');
  print('Estudiantes registrados: $estudiantes');
  print('Promedio: ${estudiantes > 0 ? (totalMinutos / estudiantes).toStringAsFixed(2) : 0}');
}

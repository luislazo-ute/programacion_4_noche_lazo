import 'dart:io';

void main() {
  print('Practica semanal de idiomas');
  print('Ingrese el nombre del estudiante:');
  String estudiante = stdin.readLineSync()!;

  int totalMinutos = 0;
  for (int dia = 1; dia <= 7; dia++) {
    print('Ingrese minutos del dia $dia:');
    int minutos = int.parse(stdin.readLineSync()!);
    totalMinutos += minutos;
  }

  double promedio = totalMinutos / 7;
  String clasificacion = promedio < 15
      ? 'Bajo ritmo'
      : promedio <= 45
          ? 'Ritmo normal'
          : 'Ritmo alto';

  print('Estudiante: $estudiante');
  print('Total minutos: $totalMinutos');
  print('Promedio diario: ${promedio.toStringAsFixed(2)}');
  print('Clasificacion: $clasificacion');
}

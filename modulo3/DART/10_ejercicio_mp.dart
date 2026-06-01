import 'dart:io';

void main() {
  int totalMinutos = 0;
  int minutos = -1;

  while (minutos != 0) {
    print('Ingrese minutos de practica (0 para finalizar):');
    minutos = int.parse(stdin.readLineSync()!);
    totalMinutos += minutos;
  }

  print('Total de minutos practicados: $totalMinutos');
}

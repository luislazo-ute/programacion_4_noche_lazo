import 'dart:io';

void main() {
  int totalAciertos = 0;
  int estudiantes = 0;

  print('Registro de aciertos en quiz');
  print('Ingrese aciertos:');
  int aciertos = int.parse(stdin.readLineSync()!);

  while (aciertos > 0) {
    if (aciertos < 6) print('Debe repasar');
    else if (aciertos <= 8) print('Buen resultado');
    else print('Excelente resultado');

    totalAciertos += aciertos;
    estudiantes++;
    print('Ingrese aciertos del siguiente estudiante (0 para terminar):');
    aciertos = int.parse(stdin.readLineSync()!);
  }

  print('Total aciertos: $totalAciertos');
  print('Estudiantes: $estudiantes');
  print('Promedio: ${estudiantes > 0 ? (totalAciertos / estudiantes).toStringAsFixed(2) : 0}');
}

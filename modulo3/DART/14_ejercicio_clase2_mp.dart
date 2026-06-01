import 'dart:io';

void main() {
  int totalPalabras = 0;
  int estudiantes = 0;

  print('Registro de palabras aprendidas');
  print('Ingrese cantidad de palabras:');
  int palabras = int.parse(stdin.readLineSync()!);

  while (palabras > 0) {
    if (palabras < 5) print('Avance bajo');
    else if (palabras <= 15) print('Avance normal');
    else print('Avance alto');

    totalPalabras += palabras;
    estudiantes++;
    print('Ingrese palabras del siguiente estudiante (0 para terminar):');
    palabras = int.parse(stdin.readLineSync()!);
  }

  print('Total de palabras: $totalPalabras');
  print('Estudiantes: $estudiantes');
  print('Promedio: ${estudiantes > 0 ? (totalPalabras / estudiantes).toStringAsFixed(2) : 0}');
}

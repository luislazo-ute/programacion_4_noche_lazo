import 'dart:io';

void main() {
  int totalLecciones = 0;
  int tutores = 0;

  print('Registro de tutores de idiomas');
  print('Ingrese lecciones revisadas:');
  int lecciones = int.parse(stdin.readLineSync()!);

  while (lecciones > 0) {
    if (lecciones < 4) print('Carga baja');
    else if (lecciones <= 10) print('Carga normal');
    else print('Carga alta');

    totalLecciones += lecciones;
    tutores++;
    print('Ingrese lecciones del siguiente tutor (0 para terminar):');
    lecciones = int.parse(stdin.readLineSync()!);
  }

  print('Total lecciones: $totalLecciones');
  print('Tutores: $tutores');
  print('Promedio: ${tutores > 0 ? (totalLecciones / tutores).toStringAsFixed(2) : 0}');
}

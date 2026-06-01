import 'dart:io';

void main() {
  print('Ingrese su nombre');
  String? nombre = stdin.readLineSync();
  print('Hola, $nombre!');

  print('Ingrese minutos de practica');
  int minutos = int.parse(stdin.readLineSync()!);
  print('Minutos registrados: $minutos');

  print('Ingrese precision del quiz');
  double precision = double.parse(stdin.readLineSync()!);
  print('Precision registrada: $precision%');
}

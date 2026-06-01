import 'dart:io';

void main() {
  print('Tabla de practica de vocabulario');
  print('Ingrese cantidad de palabras nuevas');
  int palabras = int.parse(stdin.readLineSync()!);

  for (int dia = 1; dia <= 10; dia++) {
    int repeticiones = palabras * dia;
    print('Dia $dia: $repeticiones repeticiones');
  }
}

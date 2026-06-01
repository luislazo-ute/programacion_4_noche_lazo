import 'dart:io';

void main() {
  print('Ingrese su nombre');
  String? name = stdin.readLineSync();
  print('Hello, $name!');

  print('Ingrese un número entero');
  int numero = int.parse(stdin.readLineSync()!);
  print('El número ingresado es: $numero');

  print('Ingrese un número decimal');
  double decimal = double.parse(stdin.readLineSync()!);
  print('El número decimal ingresado es: $decimal');+


}
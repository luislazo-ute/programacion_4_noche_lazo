import 'dart:io';
void main() {
    
  print('Tabla de multiplicar');
  print('Ingrese el número para mostrar su tabla de multiplicar');
  int numero = int.parse(stdin.readLineSync()!);
  
  for (int i = 1; i <= 10; i++) {
    int resultado = numero * i;
    print('$numero x $i = $resultado');
  }


}
import 'dart:io';

void main() {
    
  print('Suma de números enteros');
    int suma = 0;
    int numero = -1;
    while (numero !=0) {
      print('Ingrese un número entero (0 para finalizar):');
      numero = int.parse(stdin.readLineSync()!);
      suma += numero;
    }
    print('La suma de los números ingresados es: $suma');

}
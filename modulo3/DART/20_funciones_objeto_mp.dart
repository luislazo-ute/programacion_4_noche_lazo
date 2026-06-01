int duplicarPuntos(int n) => n * 2;
int triplicarPuntos(int n) => n * 3;

void main() {
  int Function(int) bonificador;
  bonificador = duplicarPuntos;
  print(bonificador(20));
  bonificador = triplicarPuntos;
  print(bonificador(20));

  final reglas = <int Function(int)>[duplicarPuntos, triplicarPuntos];
  for (final regla in reglas) print(regla(10));
}

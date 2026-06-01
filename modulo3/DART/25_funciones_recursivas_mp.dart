int contarRepasos(int n) {
  if (n <= 0) return 0;
  return 1 + contarRepasos(n - 1);
}

int fibonacciRacha(int n) {
  if (n <= 1) return n;
  return fibonacciRacha(n - 1) + fibonacciRacha(n - 2);
}

int contarLecciones(Map<String, dynamic> curso) {
  int total = 0;
  for (final entrada in curso.entries) {
    if (entrada.value is Map) {
      total += contarLecciones(entrada.value as Map<String, dynamic>);
    } else {
      total++;
    }
  }
  return total;
}

void main() {
  print(contarRepasos(5));
  print(fibonacciRacha(8));
  final curso = {
    'A1': {'saludos': true, 'numeros': true},
    'A2': {'viajes': true, 'comida': true},
  };
  print(contarLecciones(curso));
}

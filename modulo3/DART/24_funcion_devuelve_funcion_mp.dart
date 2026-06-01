int Function(int) crearBonificador(int factor) {
  return (int puntos) => puntos * factor;
}

void main() {
  final doble = crearBonificador(2);
  final triple = crearBonificador(3);
  print(doble(50));
  print(triple(50));

  bool Function(double) crearValidadorPrecision(double min) {
    return (precision) => precision >= min;
  }

  final aprueba = crearValidadorPrecision(70);
  print(aprueba(82.5));
  print(aprueba(60));
}

void main() {
  final resultados = [80, 95, -1, 70, 100];

  for (final resultado in resultados) {
    if (resultado < 0) {
      print('Resultado corrupto ignorado');
      continue;
    }
    print('Resultado procesado: $resultado');
  }

  for (final resultado in resultados) {
    if (resultado < 0) {
      print('Error critico en quiz');
      break;
    }
    print('Guardando $resultado');
  }
}

List<String> filtrar(List<String> lista, bool Function(String) criterio) {
  return lista.where(criterio).toList();
}

bool esLarga(String palabra) => palabra.length > 5;
bool empiezaConH(String palabra) => palabra.startsWith('h');

void main() {
  final palabras = ['hello', 'international', 'hotel', 'book'];
  print(filtrar(palabras, esLarga));
  print(filtrar(palabras, empiezaConH));
  print(filtrar(palabras, (p) => p.contains('o')));
}

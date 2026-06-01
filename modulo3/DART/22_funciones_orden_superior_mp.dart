void main() {
  final puntos = [30.0, 45.0, 60.0, 25.0];
  final conBonus = puntos.map((p) => p * 1.10);
  print(conBonus.toList());

  final unidades = ['/saludos', '/viajes', '/comida'];
  final urls = unidades.map((u) => 'https://api.language.app$u');
  print(urls.toList());

  final precisiones = [65.0, 82.5, 91.0, 70.0];
  print(precisiones.where((p) => p >= 70).toList());

  final total = puntos.fold(0.0, (acum, p) => acum + p);
  print('Total: $total');
}

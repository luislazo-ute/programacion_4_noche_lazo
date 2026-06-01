void main() {
  int puntos = 42;
  double puntosDecimal = puntos.toDouble();
  String puntosTexto = puntos.toString();

  int lecciones = int.parse('12');
  double precision = double.parse('88.5');
  int? invalido = int.tryParse('nivel-a');

  Object palabra = 'hello';
  if (palabra is String) print(palabra.length);

  String? respuesta = DateTime.now().millisecondsSinceEpoch.isEven ? null : 'ok';
  int longitud = respuesta?.length ?? 0;

  print(puntosDecimal);
  print(puntosTexto);
  print('$lecciones lecciones con $precision% de precision');
  print(invalido);
  print(longitud);
}

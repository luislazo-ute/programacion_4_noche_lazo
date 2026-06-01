Future<String> obtenerLeccionDelDia() async {
  await Future.delayed(Duration(milliseconds: 200));
  return 'Saludos en ingles';
}

void main() async {
  print('Consultando leccion del dia...');
  final leccion = await obtenerLeccionDelDia();
  print('Leccion: $leccion');
}

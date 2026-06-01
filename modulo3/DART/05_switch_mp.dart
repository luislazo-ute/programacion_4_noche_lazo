void main() {
  String codigoIdioma = 'EN';

  switch (codigoIdioma) {
    case 'EN':
      print('Ingles');
    case 'FR':
      print('Frances');
    case 'IT':
      print('Italiano');
    default:
      print('Idioma desconocido');
  }

  String descripcion = switch (codigoIdioma) {
    'EN' => 'Curso de ingles disponible',
    'FR' => 'Curso de frances disponible',
    'DE' => 'Curso de aleman disponible',
    _ => 'Curso no registrado',
  };
  print(descripcion);

  double precision = 86;
  String alerta = switch (precision) {
    double p when p >= 90 => 'Excelente pronunciacion',
    double p when p >= 70 => 'Buena pronunciacion',
    _ => 'Repetir practica oral',
  };
  print(alerta);
}

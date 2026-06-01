String construirRutaCurso(String host, String idioma, [int? unidad]) {
  if (unidad != null) return 'https://$host/$idioma/unidad/$unidad';
  return 'https://$host/$idioma';
}

String construirRutaCursoV2(String host, String idioma, [int unidad = 1]) {
  return 'https://$host/$idioma/unidad/$unidad';
}

void configurarCurso({required String idioma, required String nivel, bool audio = true, int metaMinutos = 20}) {
  print('$idioma $nivel | audio: $audio | meta: $metaMinutos min');
}

void main() {
  print(construirRutaCurso('api.language.app', 'ingles'));
  print(construirRutaCurso('api.language.app', 'ingles', 3));
  print(construirRutaCursoV2('api.language.app', 'frances'));
  configurarCurso(idioma: 'Ingles', nivel: 'A1');
}

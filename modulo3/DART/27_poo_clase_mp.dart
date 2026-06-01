class CursoIdioma {
  final String id;
  final String nombre;
  String idioma;
  bool _activo = false;

  CursoIdioma({required this.id, required this.nombre, required this.idioma});

  bool get activo => _activo;
  String get estado => _activo ? 'activo' : 'inactivo';

  set estadoActivo(bool valor) {
    _activo = valor;
    print('$nombre: $estado');
  }

  void iniciar() {
    _activo = true;
    print('Curso $nombre iniciado en $idioma');
  }

  void pausar() {
    _activo = false;
    print('Curso $nombre pausado');
  }

  String resumen() => 'ID: $id | Curso: $nombre | Idioma: $idioma | Estado: $estado';
  @override
  String toString() => 'CursoIdioma($nombre, $idioma, $estado)';
}

void main() {
  final curso = CursoIdioma(id: 'CUR-001', nombre: 'Saludos', idioma: 'Ingles');
  curso.iniciar();
  print(curso.resumen());
  curso.estadoActivo = false;
  print(curso);
}

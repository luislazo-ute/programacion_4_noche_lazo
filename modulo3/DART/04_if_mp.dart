void main() {
  String? nombre = DateTime.now().millisecondsSinceEpoch.isEven ? null : 'Ana';
  print(nombre?.length ?? 0);

  int puntaje = 82;
  if (puntaje >= 90) {
    print('Nivel avanzado');
  } else if (puntaje >= 70) {
    print('Nivel intermedio');
  } else {
    print('Nivel basico');
  }

  String estado = puntaje >= 70 ? 'Aprobado' : 'Repaso necesario';
  print(estado);
}

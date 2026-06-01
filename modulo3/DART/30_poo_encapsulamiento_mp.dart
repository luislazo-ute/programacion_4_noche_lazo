class CuentaAprendizaje {
  final String estudiante;
  int _puntos;

  CuentaAprendizaje(this.estudiante, int puntosIniciales) : _puntos = puntosIniciales;

  int get puntos => _puntos;

  void sumarPuntos(int cantidad) {
    if (cantidad <= 0) throw ArgumentError('La cantidad debe ser positiva');
    _puntos += cantidad;
    print('Puntos agregados: $cantidad. Total: $_puntos');
  }

  void gastarPuntos(int cantidad) {
    if (cantidad <= 0) throw ArgumentError('La cantidad debe ser positiva');
    if (cantidad > _puntos) throw StateError('Puntos insuficientes');
    _puntos -= cantidad;
    print('Puntos gastados: $cantidad. Total: $_puntos');
  }
}

void main() {
  final cuenta = CuentaAprendizaje('Ana Lopez', 500);
  cuenta.sumarPuntos(200);
  cuenta.gastarPuntos(150);
  print(cuenta.puntos);
}

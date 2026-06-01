abstract class Evaluacion {
  String get nombre;
  double calcularPuntaje();
}

class Vocabulario extends Evaluacion {
  final int aciertos;
  Vocabulario(this.aciertos);
  @override String get nombre => 'Vocabulario';
  @override double calcularPuntaje() => aciertos * 10.0;
}

class Pronunciacion extends Evaluacion {
  final double precision;
  Pronunciacion(this.precision);
  @override String get nombre => 'Pronunciacion';
  @override double calcularPuntaje() => precision;
}

void imprimirPuntaje(Evaluacion evaluacion) {
  print('${evaluacion.nombre}: ${evaluacion.calcularPuntaje().toStringAsFixed(2)}');
}

void main() {
  final evaluaciones = <Evaluacion>[Vocabulario(8), Pronunciacion(91.5)];
  for (final e in evaluaciones) imprimirPuntaje(e);
  final mayor = evaluaciones.reduce((a, b) => a.calcularPuntaje() > b.calcularPuntaje() ? a : b);
  print('Mayor puntaje: ${mayor.nombre}');
}

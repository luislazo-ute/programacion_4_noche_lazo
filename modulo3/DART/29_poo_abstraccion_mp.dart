abstract class ActividadIdioma {
  String get nombre;
  double calcularPuntaje();

  void describir() {
    print('$nombre - puntaje: ${calcularPuntaje().toStringAsFixed(2)}');
  }
}

class QuizVocabulario extends ActividadIdioma {
  final int aciertos;
  final int total;
  QuizVocabulario(this.aciertos, this.total);
  @override String get nombre => 'Quiz de vocabulario';
  @override double calcularPuntaje() => aciertos * 100 / total;
}

class PracticaPronunciacion extends ActividadIdioma {
  final double precision;
  PracticaPronunciacion(this.precision);
  @override String get nombre => 'Practica de pronunciacion';
  @override double calcularPuntaje() => precision;
}

void main() {
  final actividades = <ActividadIdioma>[QuizVocabulario(18, 20), PracticaPronunciacion(84.5)];
  for (final actividad in actividades) actividad.describir();
}

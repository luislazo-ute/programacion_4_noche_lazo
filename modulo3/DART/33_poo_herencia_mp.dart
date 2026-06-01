class Actividad {
  final String nombre;
  final String idioma;
  Actividad(this.nombre, this.idioma);
  String ejecutar() => 'Actividad general';
  void presentarse() => print('$nombre en $idioma: ${ejecutar()}');
}

class Quiz extends Actividad {
  Quiz(super.nombre, super.idioma);
  @override String ejecutar() => 'responder preguntas';
  void mostrarTiempo() => print('$nombre dura 10 minutos');
}

class Audio extends Actividad {
  Audio(super.nombre, super.idioma);
  @override String ejecutar() => 'escuchar dialogo';
  void reproducir() => print('Reproduciendo $nombre');
}

void main() {
  final quiz = Quiz('Saludos', 'Ingles');
  final audio = Audio('Dialogo de viaje', 'Frances');
  quiz.presentarse();
  audio.presentarse();
  quiz.mostrarTiempo();
  audio.reproducir();
}

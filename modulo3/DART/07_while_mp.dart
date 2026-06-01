void main() {
  int pendientes = 3;
  while (pendientes > 0) {
    print('Leccion pendiente: $pendientes');
    pendientes--;
  }

  int intento = 0;
  bool pronunciacionCorrecta = false;
  do {
    intento++;
    print('Intento de pronunciacion #$intento');
    if (intento == 2) pronunciacionCorrecta = true;
  } while (!pronunciacionCorrecta && intento < 3);

  print(pronunciacionCorrecta ? 'Pronunciacion aceptada' : 'Repetir audio');
}

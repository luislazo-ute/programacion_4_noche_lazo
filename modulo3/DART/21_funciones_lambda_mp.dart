void main() {
  final cuadradoRacha = (int dias) => dias * dias;
  print(cuadradoRacha(7));

  final calcularPuntaje = (double aciertos, double total) {
    return aciertos * 100 / total;
  };
  print(calcularPuntaje(18, 20));

  final palabras = ['thanks', 'hello', 'please'];
  palabras.sort((a, b) => a.compareTo(b));
  print(palabras);
}

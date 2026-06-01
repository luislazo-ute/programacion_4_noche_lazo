void main() {
  for (int dia = 1; dia <= 5; dia++) {
    print('Dia $dia: practicar vocabulario');
  }

  final palabras = ['hello', 'thanks', 'please'];
  for (final palabra in palabras) print(palabra);
  palabras.forEach((p) => print(p.toUpperCase()));

  final progreso = {'A1': 40, 'A2': 20};
  for (final entrada in progreso.entries) {
    print('${entrada.key}: ${entrada.value}%');
  }
}

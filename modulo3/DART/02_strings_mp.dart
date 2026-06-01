void main() {
  final estudiante = 'Ana';
  final idioma = 'Ingles';
  final racha = 7;

  print('Hola, $estudiante');
  print('${estudiante.toUpperCase()} practica $idioma desde hace ${racha + 1} dias');

  final tarjeta = '''
Estudiante: $estudiante
Idioma: $idioma
Racha: $racha dias
''';
  print(tarjeta);

  final frase = '  Hello language app  ';
  print(frase.trim().toUpperCase());
  print('hello,thanks,please'.split(','));
  print('Language'.substring(0, 4));
}

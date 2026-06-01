void main() {
  var estudiante = 'Ana';
  var edad = 22;
  var precision = 91.5;
  var activo = true;

  String idiomaMeta = 'Ingles';
  int lecciones = 12;
  double promedioQuiz = 9.4;
  bool premium = false;

  final fechaRegistro = DateTime.now();
  const metaDiaria = 20;

  print('$estudiante aprende $idiomaMeta');
  print('Edad: $edad | Precision: $precision | Activo: $activo');
  print('Lecciones: $lecciones | Quiz: $promedioQuiz | Premium: $premium');
  print('Registro: $fechaRegistro | Meta diaria: $metaDiaria minutos');

  final vocabulario = ['hello', 'thanks'];
  vocabulario.add('please');
  const niveles = ['A1', 'A2', 'B1'];
  print(vocabulario);
  print(niveles);
}

import 'dart:io';

void main() {
  int totalEstudiantes = 0;
  int totalErrores = 0;
  int sesiones = 0;
  int totalLecciones = 0;

  print('Registro de sesiones de idiomas');
  print('Ingrese cantidad de lecciones atendidas:');
  int lecciones = int.parse(stdin.readLineSync()!);

  while (lecciones > 0) {
    print('Ingrese estudiantes atendidos:');
    int estudiantes = int.parse(stdin.readLineSync()!);
    print('Ingrese errores corregidos:');
    int errores = int.parse(stdin.readLineSync()!);

    double estudiantesPorLeccion = estudiantes / lecciones;
    double erroresPorLeccion = errores / lecciones;

    if (estudiantesPorLeccion < 5) print('Baja actividad');
    else if (estudiantesPorLeccion <= 15) print('Actividad normal');
    else print('Alta actividad');

    print('Estudiantes por leccion: ${estudiantesPorLeccion.toStringAsFixed(2)}');
    print('Errores por leccion: ${erroresPorLeccion.toStringAsFixed(2)}');

    totalEstudiantes += estudiantes;
    totalErrores += errores;
    totalLecciones += lecciones;
    sesiones++;

    print('Ingrese lecciones de la siguiente sesion (0 para terminar):');
    lecciones = int.parse(stdin.readLineSync()!);
  }

  print('Total estudiantes: $totalEstudiantes');
  print('Total errores corregidos: $totalErrores');
  print('Sesiones: $sesiones');
  print('Promedio estudiantes por sesion: ${sesiones > 0 ? (totalEstudiantes / sesiones).toStringAsFixed(2) : 0}');
  print('Promedio errores por leccion: ${totalLecciones > 0 ? (totalErrores / totalLecciones).toStringAsFixed(2) : 0}');
}

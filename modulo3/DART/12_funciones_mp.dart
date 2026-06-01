void saludar() => print('Bienvenido a Language App');
void saludarConNombre(String nombre) => print('Hola, $nombre');
int obtenerMetaDiaria() => 20;
int sumarPuntos(int a, int b) => a + b;
int multiplicarMinutos(int minutos, int factor) => minutos * factor;
void registrarUsuario({required String nombre, required String idioma}) {
  print('Usuario registrado: $nombre, idioma: $idioma');
}
String formatearPuntos(int puntos) => '$puntos pts';

void main() {
  saludar();
  saludarConNombre('Luis Lazo');
  print(obtenerMetaDiaria());
  print(sumarPuntos(50, 30));
  print(multiplicarMinutos(15, 2));
  registrarUsuario(nombre: 'Luis Lazo', idioma: 'Ingles');
  print(formatearPuntos(120));
}

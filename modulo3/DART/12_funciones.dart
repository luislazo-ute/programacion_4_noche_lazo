//Función sin parámetros y sin retorno
void saludar() {
  print('Hola, bienvenido a Dart!');
}
//Función con parámetros y sin retorno
void saludoConParametro(String nombre) {
  print('Hola, $nombre! Bienvenido a Dart!');
}

//Funcion sin parámetros y con retorno
int obtenerNumero() {
  return 42;
}

//Funcion con parámetros y con retorno
int sumar(int a, int b) {
  return a + b;
}

//Funcion flecha (arrow function)
int multiplicar(int a, int b) => a * b;

//Funcion con parámetros opcionales
void saludoOpcional(String nombre, [String? saludo='Hola']) {
  print('$saludo, $nombre!');
}

//Funcion con parámetros nombrados
void registroUsuario({
    required String nombre,
    required int edad,
}){
  print('Usuario registrado: $nombre, Edad: $edad');
}


void main() {
  saludar();
  saludoConParametro('Luis Lazo');
  int numero = obtenerNumero();
  print('El número obtenido es: $numero');
  print('El número obtenido es: ${obtenerNumero()}');
  print('La suma de 5 y 7 es: ${sumar(5, 7)}');
  print('La multiplicación de 5 y 7 es: ${multiplicar(5, 7)}');
  saludoOpcional('Luis Lazo');
  saludoOpcional('Luis Lazo', 'Buen día');
  registroUsuario(nombre: 'Luis Lazo', edad: 30);
}

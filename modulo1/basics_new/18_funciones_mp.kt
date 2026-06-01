fun main() {
    saludarApp()
    saludarEstudiante("Luis")
    println("Puntos totales: ${sumarPuntos(120, 80)}")
    println("Puntos despues de penalizacion: ${restarPuntos(120, 20)}")
    mostrarCuadradoDeRacha()
    println("Practica doble: ${multiplicarPractica(15, 2)} minutos")
}

fun saludarApp() = println("Bienvenido a Language App")
fun saludarEstudiante(nombre: String) = println("Buenas noches, $nombre")
fun sumarPuntos(a: Int, b: Int): Int = a + b
fun restarPuntos(a: Int, b: Int) = a - b
fun mostrarCuadradoDeRacha() {
    fun cuadrado(x: Int) = x * x
    println("Racha al cuadrado: ${cuadrado(5)}")
}
val multiplicarPractica = { minutos: Int, factor: Int -> minutos * factor }

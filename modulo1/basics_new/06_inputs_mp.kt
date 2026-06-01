fun main() {
    println("Nombre del estudiante:")
    val nombre = readLine()?.trim().orEmpty()

    println("Idioma que desea practicar:")
    val idioma = readLine()?.trim().orEmpty()

    println("Minutos de practica hoy:")
    val minutos = readLine()?.toDoubleOrNull() ?: 0.0

    println("Hola $nombre, hoy practicaras $idioma")
    println("Meta recomendada: ${minutos * 2} minutos esta semana")
}

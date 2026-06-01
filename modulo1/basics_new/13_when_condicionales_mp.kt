fun main() {
    println("Edad del estudiante:")
    val edad = readLine()?.toIntOrNull() ?: 0
    println("Puntaje de entrada:")
    val puntaje = readLine()?.toIntOrNull() ?: 0

    val plan = when {
        edad < 12 && puntaje < 50 -> "Kids inicial"
        edad < 12 -> "Kids conversacion"
        puntaje >= 85 -> "Ruta avanzada"
        puntaje >= 60 -> "Ruta intermedia"
        else -> "Ruta basica"
    }

    println("Plan asignado: $plan")
}

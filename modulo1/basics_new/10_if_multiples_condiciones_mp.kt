fun main() {
    println("Puntaje del examen de vocabulario:")
    val puntaje = readLine()?.toIntOrNull() ?: 0

    val nivel = if (puntaje < 40) {
        "Inicial"
    } else if (puntaje < 70) {
        "Basico"
    } else if (puntaje < 90) {
        "Intermedio"
    } else {
        "Avanzado"
    }

    println("Nivel recomendado: $nivel")
}

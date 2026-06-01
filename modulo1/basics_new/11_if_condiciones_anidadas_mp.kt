fun main() {
    println("Ya completo la unidad de pronunciacion? s/n")
    val completoPronunciacion = readLine()?.trim()?.lowercase() == "s"

    println("Aciertos del quiz:")
    val aciertos = readLine()?.toIntOrNull() ?: 0

    if (completoPronunciacion) {
        if (aciertos >= 8) println("Avanza a conversacion") else println("Repite practica oral")
    } else {
        if (aciertos >= 8) println("Buen vocabulario, falta pronunciacion") else println("Completa vocabulario basico")
    }
}

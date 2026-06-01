fun main() {
    var leccion = 1
    while (leccion <= 3) {
        println("Completando leccion $leccion")
        leccion++
    }

    var intento = 1
    do {
        println("Intento de pronunciacion $intento")
        intento++
    } while (intento <= 2)

    while (true) {
        println("Escribe una palabra o salir:")
        val palabra = readLine()?.trim().orEmpty()
        if (palabra == "salir") break
        if (palabra.isBlank()) continue
        println("Guardado para repaso: $palabra")
    }
}

fun main() {
    val sumarPuntos: (Int, Int) -> Int = { a, b -> a + b }
    val duplicarPractica: (Int) -> Int = { it * 2 }
    val formatearPalabra: (String) -> String = { it.trim().lowercase() }

    println(sumarPuntos(10, 15))
    println(duplicarPractica(20))
    println(formatearPalabra("  HELLO "))
}

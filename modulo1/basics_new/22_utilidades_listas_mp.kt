fun main() {
    val puntos = listOf(5, 8, 10, 6, 9, 3)
    println("Dobles: ${puntos.map { it * 2 }}")
    println("Etiquetas: ${puntos.map { "Quiz$it" }}")
    println("Aprobados: ${puntos.filter { it >= 7 }}")
    println("Pendientes: ${puntos.filterNot { it >= 7 }}")

    val palabras = listOf("hello", "water", "international", "book")
    println("Palabras largas: ${palabras.filter { it.length > 5 }}")
}

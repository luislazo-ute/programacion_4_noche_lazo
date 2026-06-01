fun main() {
    val lecciones: Int = 12
    val leccionesDecimal: Double = lecciones.toDouble()
    val leccionesTexto: String = lecciones.toString()

    println("Lecciones como decimal: $leccionesDecimal")
    println("Lecciones como texto: $leccionesTexto")

    val puntos = "350".toInt()
    val precision = "92.5".toDouble()
    val entradaInvalida = "nivel-a".toIntOrNull()

    println("Puntos: $puntos")
    println("Precision: $precision")
    println("Conversion invalida: $entradaInvalida")
}

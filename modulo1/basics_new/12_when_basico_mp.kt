fun main() {
    println("Codigo de idioma (1-5):")
    val codigo = readLine()?.toIntOrNull() ?: 0

    val idioma = when (codigo) {
        1 -> "Ingles"
        2 -> "Frances"
        3 -> "Italiano"
        4 -> "Aleman"
        5 -> "Portugues"
        else -> "Idioma no registrado"
    }

    println("Idioma elegido: $idioma")
}

fun main() {
    println("Cuantas palabras nuevas repasara?")
    val cantidad = readLine()?.toIntOrNull() ?: 3
    var totalCaracteres = 0

    repeat(cantidad) { i ->
        println("Palabra ${i + 1}:")
        val palabra = readLine()?.trim().orEmpty()
        totalCaracteres += palabra.length
    }

    if (cantidad > 0) {
        println("Promedio de caracteres: ${totalCaracteres / cantidad}")
    } else {
        println("Cantidad invalida")
    }
}

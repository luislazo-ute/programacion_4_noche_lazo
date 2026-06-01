fun main() {
    val traducciones = mapOf(
        "hello" to "hola",
        "thanks" to "gracias",
        "book" to "libro"
    )

    println(traducciones["hello"])
    println(traducciones.getOrDefault("water", "sin traduccion"))
    for ((ingles, espanol) in traducciones) println("$ingles -> $espanol")

    val progreso = mutableMapOf("Ana" to 12, "Luis" to 9)
    progreso["Mia"] = 4
    progreso["Ana"] = 13
    progreso.getOrPut("Pedro") { 1 }
    println(progreso)
}

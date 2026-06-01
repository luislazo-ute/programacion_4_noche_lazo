fun main() {
    val vocabulario = listOf("hello", "book", "water", "friend", "school")
    println(vocabulario)
    println("Total: ${vocabulario.size}")
    println("Primera palabra: ${vocabulario.first()}")
    println("Ultima palabra: ${vocabulario.last()}")
    println("Contiene water: ${"water" in vocabulario}")
    println("Primeras 2: ${vocabulario.take(2)}")

    val repasos = mutableListOf("pronunciacion", "gramatica")
    repasos.add("escucha")
    repasos[0] = "vocabulario"
    println(repasos)

    val cola = ArrayDeque<String>()
    cola.addLast("lesson-1")
    cola.addLast("lesson-2")
    println("Siguiente: ${cola.removeFirst()}")
}

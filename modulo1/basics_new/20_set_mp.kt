fun main() {
    val palabras = setOf("hello", "thanks", "hello", "please")
    println("Palabras unicas: $palabras")

    val basicas = setOf("hello", "thanks", "please")
    val viaje = setOf("ticket", "hotel", "thanks")
    println("Union: ${basicas union viaje}")
    println("Interseccion: ${basicas intersect viaje}")
    println("Solo basicas: ${basicas subtract viaje}")

    val idiomas = mutableSetOf("ingles", "frances")
    idiomas.add("ingles")
    idiomas.add("italiano")
    println(idiomas)
}

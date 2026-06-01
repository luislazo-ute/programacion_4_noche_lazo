data class Leccion(
    val id: Int,
    val titulo: String,
    val idioma: String,
    val duracionMinutos: Int,
    val activa: Boolean = true
)

fun main() {
    val l1 = Leccion(1, "Saludos", "Ingles", 15)
    val l2 = l1.copy(duracionMinutos = 20)
    val l3 = Leccion(2, "Viajes", "Frances", 18)

    println(l1)
    println(l1 == l2)
    val (id, titulo, idioma) = l1
    println("$id: $titulo en $idioma")
    listOf(l1, l2, l3).forEach { println("${it.titulo}: ${it.duracionMinutos} min") }
}

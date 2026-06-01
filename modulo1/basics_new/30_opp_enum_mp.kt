enum class EstadoLeccion(val descripcion: String, val esTerminal: Boolean) {
    PENDIENTE("Por iniciar", false),
    EN_CURSO("Practicando", false),
    APROBADA("Leccion aprobada", true),
    REPROBADA("Debe repetir", true),
    BLOQUEADA("Bloqueada por prerequisito", true);

    fun puedeTransicionarA(siguiente: EstadoLeccion): Boolean = when (this) {
        PENDIENTE -> siguiente == EN_CURSO || siguiente == BLOQUEADA
        EN_CURSO -> siguiente == APROBADA || siguiente == REPROBADA
        else -> false
    }
}

fun main() {
    val estado = EstadoLeccion.EN_CURSO
    println(estado.descripcion)
    val etiqueta = when (estado) {
        EstadoLeccion.PENDIENTE -> "pendiente"
        EstadoLeccion.EN_CURSO -> "practica"
        EstadoLeccion.APROBADA -> "aprobada"
        EstadoLeccion.REPROBADA -> "repaso"
        EstadoLeccion.BLOQUEADA -> "bloqueada"
    }
    println(etiqueta)
    println(estado.puedeTransicionarA(EstadoLeccion.APROBADA))
}

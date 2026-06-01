abstract class EvaluacionIdioma(val nombre: String) {
    abstract val puntaje: Double
    abstract fun descripcion(): String

    fun aprobado(): Boolean = puntaje >= 70.0
    override fun toString() = "${descripcion()} | Puntaje: ${"%.2f".format(puntaje)}"
}

class EvaluacionVocabulario(val aciertos: Int, val total: Int) : EvaluacionIdioma("Vocabulario") {
    override val puntaje: Double get() = aciertos * 100.0 / total
    override fun descripcion() = "Vocabulario: $aciertos de $total"
}

class EvaluacionPronunciacion(val precision: Double) : EvaluacionIdioma("Pronunciacion") {
    override val puntaje: Double get() = precision
    override fun descripcion() = "Pronunciacion con precision $precision%"
}

fun main() {
    val evaluaciones: List<EvaluacionIdioma> = listOf(
        EvaluacionVocabulario(18, 20),
        EvaluacionPronunciacion(82.5)
    )
    evaluaciones.forEach { println("$it | Aprobado: ${it.aprobado()}") }
}

fun main() {
    val estudiante = "Ana"
    val idiomaMeta: String = "Ingles"
    var leccionesCompletadas = 0
    leccionesCompletadas += 1

    val nivel: Byte = 2
    val puntos: Int = 1250
    val minutosEstudio: Long = 3600L
    val precision: Float = 87.5f
    val promedioQuiz: Double = 9.4
    val activo: Boolean = true
    val inicialIdioma: Char = 'I'
    val mensaje = "Practica diaria"

    println("$estudiante aprende $idiomaMeta")
    println("Lecciones: $leccionesCompletadas | Nivel: $nivel | Puntos: $puntos")
    println("Minutos: $minutosEstudio | Precision: $precision | Quiz: $promedioQuiz")
    println("Activo: $activo | Inicial: $inicialIdioma | $mensaje")
    println("Curso en mayusculas: ${idiomaMeta.uppercase()}")
    println("Tipo inferido: ${mensaje::class.simpleName}")
}

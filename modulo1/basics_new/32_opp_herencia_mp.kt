open class ActividadIdioma(val nombre: String, val idioma: String) {
    open fun iniciar() = println("Iniciando $nombre en $idioma")
    open fun descripcion() = "$nombre para practicar $idioma"
    fun registrarTiempo(minutos: Int) = println("Tiempo registrado: $minutos minutos")
}

class QuizVocabulario(nombre: String, idioma: String) : ActividadIdioma(nombre, idioma) {
    override fun iniciar() {
        super.iniciar()
        println("Cargando preguntas de vocabulario")
    }
    override fun descripcion() = "Quiz: ${super.descripcion()}"
}

class PracticaEscucha(nombre: String, idioma: String, val audio: String) : ActividadIdioma(nombre, idioma) {
    override fun descripcion() = "Escucha con audio $audio para $idioma"
}

fun main() {
    val quiz = QuizVocabulario("Saludos", "Ingles")
    val escucha = PracticaEscucha("Conversacion corta", "Frances", "audio-01.mp3")
    quiz.iniciar()
    println(escucha.descripcion())
    quiz.registrarTiempo(15)
}

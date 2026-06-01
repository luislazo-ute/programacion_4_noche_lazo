class CursoIdioma(val idioma: String, val nivel: String, val lecciones: Int) {
    constructor(idioma: String) : this(idioma, "Basico", 10)
    constructor(idioma: String, lecciones: Int) : this(idioma, "Personalizado", lecciones)

    val resumen: String get() = "$idioma - $nivel ($lecciones lecciones)"
    override fun toString() = "CursoIdioma($resumen)"
}

fun main() {
    val c1 = CursoIdioma("Ingles", "Intermedio", 24)
    val c2 = CursoIdioma("Frances")
    val c3 = CursoIdioma("Italiano", 8)
    println(c1)
    println(c2)
    println(c3)
}

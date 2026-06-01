interface Exportable {
    val id: String
    fun exportar(): String
    val version: Int get() = 1
}

interface ValidableContenido {
    val errores: List<String>
    val esValido: Boolean get() = errores.isEmpty()
    fun validar(): Boolean
    fun imprimirErrores() {
        if (errores.isEmpty()) println("Sin errores") else errores.forEach { println(it) }
    }
}

data class Flashcard(
    override val id: String,
    val palabra: String,
    val traduccion: String,
    val idioma: String
) : Exportable, ValidableContenido {
    override fun exportar() = "$id|$idioma|$palabra|$traduccion"
    override val errores: List<String> get() = buildList {
        if (palabra.isBlank()) add("La palabra no puede estar vacia")
        if (traduccion.isBlank()) add("La traduccion no puede estar vacia")
        if (idioma.isBlank()) add("El idioma es requerido")
    }
    override fun validar() = esValido
}

fun main() {
    val card1 = Flashcard("F001", "hello", "hola", "Ingles")
    val card2 = Flashcard("F002", "", "gracias", "Ingles")

    fun procesarExportable(e: Exportable) = println(e.exportar())
    fun procesarValidable(v: ValidableContenido) {
        println("Valido: ${v.esValido}")
        v.imprimirErrores()
    }

    procesarExportable(card1)
    procesarValidable(card1)
    procesarValidable(card2)
}

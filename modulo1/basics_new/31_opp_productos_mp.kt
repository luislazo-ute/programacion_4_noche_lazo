data class CategoriaCurso(val id: Int, val nombre: String)

data class CursoApp(
    val id: Int,
    val nombre: String,
    val idioma: String,
    val lecciones: Int,
    val categoria: CategoriaCurso,
    val activo: Boolean = true
) {
    val disponible: Boolean get() = activo && lecciones > 0
    fun agregarLecciones(cantidad: Int): CursoApp {
        require(cantidad >= 0) { "Cantidad invalida" }
        return copy(lecciones = lecciones + cantidad)
    }
}

object CatalogoCursos {
    private val categorias = mutableListOf(
        CategoriaCurso(1, "Vocabulario"),
        CategoriaCurso(2, "Conversacion"),
        CategoriaCurso(3, "Gramatica")
    )
    private val cursos = mutableListOf<CursoApp>()
    private var siguienteId = 1

    fun agregarCurso(nombre: String, idioma: String, lecciones: Int, categoriaId: Int): CursoApp? {
        val categoria = categorias.find { it.id == categoriaId } ?: return null
        val curso = CursoApp(siguienteId++, nombre, idioma, lecciones, categoria)
        cursos.add(curso)
        return curso
    }

    fun listar(): List<CursoApp> = cursos.toList()
    fun disponibles(): List<CursoApp> = cursos.filter { it.disponible }
    fun buscar(query: String): List<CursoApp> = cursos.filter { it.nombre.contains(query, ignoreCase = true) }
}

fun main() {
    CatalogoCursos.agregarCurso("Saludos basicos", "Ingles", 10, 1)
    CatalogoCursos.agregarCurso("Viajes", "Frances", 8, 2)
    CatalogoCursos.agregarCurso("Verbos esenciales", "Aleman", 12, 3)

    CatalogoCursos.listar().forEach { println("${it.nombre} - ${it.idioma}: ${it.lecciones} lecciones") }
    println("Disponibles: ${CatalogoCursos.disponibles().size}")
}

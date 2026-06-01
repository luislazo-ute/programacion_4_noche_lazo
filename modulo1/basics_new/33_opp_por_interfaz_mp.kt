interface Practicable {
    val nombre: String
    fun ejecutar(): Boolean
}

class Lectura(override val nombre: String) : Practicable {
    override fun ejecutar(): Boolean {
        println("Leyendo texto: $nombre")
        return true
    }
}

class Audio(override val nombre: String) : Practicable {
    override fun ejecutar(): Boolean {
        println("Escuchando audio: $nombre")
        return true
    }
}

class Escritura(override val nombre: String) : Practicable {
    override fun ejecutar(): Boolean {
        println("Escribiendo respuestas: $nombre")
        return true
    }
}

fun practicar(actividad: Practicable) {
    println("Actividad: ${actividad.nombre}")
    println(if (actividad.ejecutar()) "Completada" else "Pendiente")
}

fun main() {
    val actividades = listOf(Lectura("Historia corta"), Audio("Dialogo"), Escritura("Frases utiles"))
    actividades.forEach { practicar(it) }
}

class ProgresoLeccion(porcentaje: Double) {
    var porcentaje: Double = porcentaje
        set(value) {
            require(value in 0.0..100.0) { "El progreso debe estar entre 0 y 100" }
            field = value
        }

    val completado: Boolean get() = porcentaje >= 100.0
    val descripcion: String get() = when {
        porcentaje < 25 -> "Inicio"
        porcentaje < 70 -> "En practica"
        porcentaje < 100 -> "Casi listo"
        else -> "Completado"
    }
}

fun main() {
    val progreso = ProgresoLeccion(45.0)
    println("${progreso.porcentaje}% -> ${progreso.descripcion}")
    progreso.porcentaje = 100.0
    println("Completado: ${progreso.completado}")
}

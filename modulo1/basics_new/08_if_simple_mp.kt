fun main() {
    println("Porcentaje del quiz:")
    val porcentaje = readLine()?.toDoubleOrNull() ?: 0.0

    if (porcentaje >= 70) {
        println("Leccion aprobada")
    }
    if (porcentaje >= 95) {
        println("Insignia de pronunciacion desbloqueada")
    }

    println("Resultado registrado: $porcentaje%")
}

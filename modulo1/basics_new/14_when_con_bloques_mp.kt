fun main() {
    println("Nombre del estudiante:")
    val estudiante = readLine()?.trim().orEmpty()
    println("Estado de practica (NUEVO/EN_CURSO/COMPLETADO/BLOQUEADO):")
    val estado = readLine()?.trim()?.uppercase().orEmpty()

    when (estado) {
        "NUEVO" -> {
            println("Bienvenido $estudiante")
            println("Abrir diagnostico inicial")
        }
        "EN_CURSO" -> {
            println("Continuar leccion de $estudiante")
            println("Mostrar ultima palabra practicada")
        }
        "COMPLETADO" -> println("Entregar insignia a $estudiante")
        "BLOQUEADO" -> println("Sugerir repaso antes de avanzar")
        else -> println("Estado no reconocido")
    }
}

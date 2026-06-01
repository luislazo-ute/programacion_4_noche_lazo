fun main() {
    val completoLeccion = true
    val aproboQuiz = false
    val tieneRacha = true
    val tieneConexion = true

    println("Puede avanzar: ${completoLeccion && aproboQuiz}")
    println("Mostrar repaso: ${!aproboQuiz || !tieneRacha}")
    println("Sincronizar progreso: ${tieneConexion && (completoLeccion || tieneRacha)}")
    println("Quiz pendiente: ${!aproboQuiz}")
}

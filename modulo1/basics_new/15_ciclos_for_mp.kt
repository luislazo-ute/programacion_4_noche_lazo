fun main() {
    println("Lecciones de la semana")
    for (dia in 1..5) println("Dia $dia: practica de vocabulario")

    println("Repaso por indices")
    val palabras = listOf("hello", "thanks", "please")
    for ((indice, palabra) in palabras.withIndex()) {
        println("${indice + 1}. $palabra")
    }

    println("Cuenta regresiva para iniciar quiz")
    for (segundo in 3 downTo 1) println(segundo)
}

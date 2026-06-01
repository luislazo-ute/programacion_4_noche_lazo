fun main() {
    val palabrasAprendidas = 24
    val palabrasNuevas = 6

    println("Total palabras: ${palabrasAprendidas + palabrasNuevas}")
    println("Palabras restantes del bloque: ${palabrasAprendidas - palabrasNuevas}")
    println("Practica duplicada: ${palabrasNuevas * 2}")
    println("Grupos de repaso: ${palabrasAprendidas / 4}")
    println("Sobrantes: ${palabrasAprendidas % 5}")

    var puntos = 100
    puntos += 25
    puntos -= 10
    puntos *= 2
    puntos /= 5
    println("Puntos finales: $puntos")

    var racha = 0
    racha++
    println("Racha actual: $racha dia")
}

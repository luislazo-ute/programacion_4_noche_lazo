fun main() {
    val aciertos = 8
    val meta = 10

    println("Aciertos == meta: ${aciertos == meta}")
    println("Aciertos != meta: ${aciertos != meta}")
    println("Aciertos < meta: ${aciertos < meta}")
    println("Aciertos >= aprobado: ${aciertos >= 7}")

    val respuestaUsuario = "hello"
    val respuestaCorrecta = "hello"
    println("Mismo contenido: ${respuestaUsuario == respuestaCorrecta}")
    println("Equals ignore case: ${respuestaUsuario.equals("HELLO", ignoreCase = true)}")
}

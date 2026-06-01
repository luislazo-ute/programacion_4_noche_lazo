class EstudianteIdioma(val nombre: String, val email: String) {
    val nombreNormalizado: String
    val dominioEmail: String

    init {
        require(nombre.isNotBlank()) { "El nombre no puede estar vacio" }
        require(email.contains("@")) { "Email invalido: $email" }
        nombreNormalizado = nombre.trim().lowercase()
        dominioEmail = email.substringAfter("@")
    }
}

fun main() {
    val estudiante = EstudianteIdioma("  Ana Garcia  ", "ana@language.app")
    println(estudiante.nombreNormalizado)
    println(estudiante.dominioEmail)
}

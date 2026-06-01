object ConfiguracionLanguageApp {
    val host = "api.language-app.test"
    val puerto = 443
    private val apiKey = "lang-secret"

    fun baseUrl() = "https://$host:$puerto"
    fun headers() = mapOf("Authorization" to "Bearer $apiKey")
}

class PerfilEstudiante private constructor(val id: Int, val nombre: String) {
    companion object {
        private var contadorId = 0
        fun crear(nombre: String, email: String): PerfilEstudiante? {
            if (nombre.isBlank() || !email.contains("@")) return null
            return PerfilEstudiante(++contadorId, nombre.trim())
        }
        const val ROL_DEFECTO = "aprendiz"
    }
}

fun main() {
    println(ConfiguracionLanguageApp.baseUrl())
    val perfil = PerfilEstudiante.crear("Ana", "ana@test.com")
    println(perfil?.nombre)
}

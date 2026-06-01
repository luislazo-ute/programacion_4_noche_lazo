class CuentaAprendizaje(val estudiante: String, puntosIniciales: Int) {
    private var puntos: Int = puntosIniciales
    internal val codigoCuenta: String = "LANG-${(1000..9999).random()}"

    fun sumarPuntos(cantidad: Int) {
        require(cantidad > 0) { "la cantidad debe ser positiva" }
        puntos += cantidad
        println("Puntos agregados: $cantidad | Total: $puntos")
    }

    fun gastarPuntos(cantidad: Int): Boolean {
        require(cantidad > 0) { "la cantidad debe ser positiva" }
        if (cantidad > puntos) {
            println("Puntos insuficientes")
            return false
        }
        puntos -= cantidad
        println("Puntos gastados: $cantidad | Total: $puntos")
        return true
    }

    fun consultarPuntos(): Int = puntos
}

fun main() {
    val cuenta = CuentaAprendizaje("Luis Lazo", 150)
    cuenta.sumarPuntos(50)
    cuenta.gastarPuntos(80)
    cuenta.gastarPuntos(200)
    println(cuenta.estudiante)
    println(cuenta.consultarPuntos())
}

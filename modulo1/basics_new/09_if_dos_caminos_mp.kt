fun main() {
    println("Tiene suscripcion premium? s/n")
    val premium = readLine()?.trim()?.lowercase() == "s"

    println("Costo base del curso:")
    val costoBase = readLine()?.toDoubleOrNull() ?: 0.0

    if (premium) {
        val descuento = costoBase * 0.40
        println("Premium descuenta ${'$'}${"%.2f".format(descuento)}. Total: ${costoBase - descuento}")
    } else {
        println("Total sin descuento: $costoBase")
    }
}

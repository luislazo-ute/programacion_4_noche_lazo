fun main() {
    println("When con condiciones")
    println("Edad del paciente")
    val edad = readLine()?.toIntOrNull()?:0
    println("Tiene seguro?s/n")
    val tieneSeguro = readLine()?.trim()?.lowercase() == "s"
    
    val nivel = if(tieneSeguro){
        println("Nivel del seguro (BASICO/INTERMEDIO/PREMIUM)")
        val nivelSeguro = readLine()?.trim()?.uppercase()?:""
    }else ""
    val copago = when {
        !tieneSeguro && edad <18->0
        !tieneSeguro && edad >=65->15.0
        !tieneSeguro -> 45.0
        nivelSeguro=="BASICO"->20.0
        nivelSeguro=="INTERMEDIO"->10.0
        nivelSeguro=="PREMIUM"->0.0
        else->30.0
    }
    println("Copago aplicado: $${"%.2f".format(copago)}")

}

/**ejercicio
fun main() {
    println("When con condiciones")

    println("¿Tiene dolor de pecho? s/n")
    val pecho = readLine()?.trim()?.lowercase() == "s"

    println("¿Tiene dificultad respiratoria? s/n")
    val respiratoria = readLine()?.trim()?.lowercase() == "s"

    println("Temperatura del paciente:")
    val temperatura = readLine()?.toDoubleOrNull() ?: 0.0

    val triaje = when {
        pecho && respiratoria -> "P1 - Emergencia"
        pecho -> "P2 - Urgente"
        temperatura >= 39.5 -> "P2 - Urgente"
        temperatura >= 38.0||temperatura <=39.4 -> "P3 - Prioritario"
        else -> "P4 - Consulta general"
    }

    println("El tipo de triaje es: $triaje")
}
**/
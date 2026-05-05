fun main() {

    println("CICLOS repeat")
    println("¿Cuántas pulsaciones tomar para calcular frecuencia?")
    
    val mediciones = readLine()?.toIntOrNull() ?: 3
    var totalPulsaciones = 0

    repeat(mediciones) { i ->
        println("Medición ${i + 1} (pulsos en 15 segundos):")
        val pulsos = readLine()?.toIntOrNull() ?: 0
        totalPulsaciones += pulsos * 4 // convertir a pulsaciones por minuto
    }

    if (mediciones > 0) {
        val promedio = totalPulsaciones / mediciones

        println("Frecuencia cardiaca promedio: $promedio lpm")
        println("Clasificación: ${
            when {
                promedio < 60 -> "Bradicardia"
                promedio <= 100 -> "Normal"
                else -> "Taquicardia"
            }
        }")
    } else {
        println("Número de mediciones inválido.")
    }
}

/*
fun main() {

    println("CICLOS repeat")
    println("Mediciones 24 horas")

    val mediciones = 6
    var contador = 0
    var totalTemp = 0.0

    repeat(mediciones) { i ->
        println("Medición ${i + 1} (mediciones cada 4 horas):")
        val temperatura = readLine()?.toDoubleOrNull() ?: 0.0
        totalTemp += temperatura

        if (temperatura > 38.5) {
            println("Fiebre alta")
            contador++
        } else {
            println("Fiebre normal")
        }
    }

    println("Las fiebres altas fueron $contador")
    println("El promedio es ${totalTemp / mediciones}")
}
*/
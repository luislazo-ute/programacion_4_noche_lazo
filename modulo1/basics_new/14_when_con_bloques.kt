fun main(){
    println("when con bloques de codigo")
    println("Nombre paciente:")
    val paciente = readLine()?.trim()?:""
    println("Nivel de alerta CRITICO/URGENTE/MODERADO/LEVE:")
    val nivel = readLine()?.trim()?.uppercase()?:""
    
    when(nivel){
        "CRITICO"->{
            println("ALERTA CRITICA-Paciente. $paciente")
            println("Accion inmediata")
            println("Registrar hora de activacion de protocolo")
        }
        "URGENTE"->{
            println("URGENTE-Paciente. $paciente")
            println("Priorizar sala de espera")
            println("Reevaluar en 15 minutos")
        }
        "MODERADO"->println("Moderado-Paciente. $paciente, registrar monitorear")
        "LEVE"->println("Leve-Paciente. $paciente, registrar en lista normal")
        else-> println("Protocolo no conocido")
    }
    println("Edad:")
    val edad = readLine()?.toIntOrNull()?:0
    val tarifa = when(edad){
        in 0..2 -> "Neonatal"
        in 3..11 -> "Pediatrico"
        in 12..17 -> "Adolescente"
        in 18..64 -> "Adulto"
        else -> "Adulto mayor"
    }
    
    println("$edad años -> $tarifa")
}
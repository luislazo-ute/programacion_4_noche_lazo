fun main() {
    println("Condicional When")
    println("¿Codigo de especialidad? (1-7)")
    val codigo = readLine()?.toIntOrNull()?:0
    val especialidad = when(codigo){
        1->"Medicina general"
        2->"Pediatra"
        3->"Cardiologia"
        4->"Ginecologia"
        5->"Traumatologia"
        6->"Neurologia"
        7->"Dermatologia"
        else->"Especialidad no registrada"
    }
    println("Especialidad: $especialidad")

}
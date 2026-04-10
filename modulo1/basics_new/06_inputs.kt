fun main() {
    println("Inputs")
    println("Escribe Nombre")
    val nombre=readLine()
    println("Hola $nombre")
    
    println("Escriba su edad:")
    val edadStr = readLine()
    val edadNum = edadStr?.toDoubleOrNull() ?: 0.0
    println("Tu edad es ${edadNum}")
    println("El doble de edad es: ${edadNum * 2}")
    
}
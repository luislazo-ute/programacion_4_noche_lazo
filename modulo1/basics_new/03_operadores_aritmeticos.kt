//Operadores Aritmeticos
fun main() {
    
    val numero1 = 10
    val numero2 = 2
    println("suma")
    println("numero+numero2= ${numero1+numero2}")
    println("resta")
    println("numero-numero2= ${numero1-numero2}")
    println("multiplicacion")
    println("numero*numero2= ${numero1*numero2}")
    println("division")
    println("numero/numero2= ${numero1/numero2}")
    println("modulo")
    println("numero%numero2= ${numero1%numero2}")
    
    println("Operadores de Asiganción Compuesta")
    var x = 10
    x+=5
    println("x+=5 ${x}")
    x-=3
    println("x-=3 ${x}")
    x*=2
    println("x*=2 ${x}")
    x/=4
    println("x/=4 ${x}")
    x%=4
    println("x%=4 ${x}")
    
    //Incremento decremento
    var contador = 0
    contador ++
    println("contador++ ${contador}")
    contador --
    println("contador-- ${contador}")
    
}
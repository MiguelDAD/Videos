.data
number: .word 2         # Definimos un n�mero que vamos a cuadrar
message: .asciiz "El cuadrado es: "  # Mensaje para imprimir antes del resultado

.text
.globl main

main:
    lw $a0, number     # Cargamos el valor de 'number' en $a0
    jal square         # Llamamos a la funci�n 'square'

    # Guardamos el resultado en un registro temporal
    move $t0, $v0      # Mover el resultado a $t0 para preservarlo

    # Imprimir el mensaje "El cuadrado es: "
    li $v0, 4          # Syscall para imprimir cadena
    la $a0, message    # Cargar la direcci�n del mensaje en $a0
    syscall            # Llamamos a la syscall

    # Imprimir el resultado (el cuadrado calculado)
    li $v0, 1          # Syscall para imprimir entero
    move $a0, $t0      # Mover el resultado almacenado en $t0 a $a0
    syscall            # Llamamos a la syscall
    
    # Finalizar el programa
    li $v0, 10         # Syscall para salir
    syscall            # Llamamos a la syscall para terminar el programa
    
    # Funci�n: square
    # Prop�sito: Calcular el cuadrado de un n�mero
    # Argumento: $a0 (el n�mero a cuadrar)
    # Retorno: $v0 (el cuadrado del n�mero)
    square:
        mul $v0, $a0, $a0  # Multiplica $a0 por s� mismo y almacena el resultado en $v0
        jr $ra             # Retorna a la direcci�n almacenada en $ra


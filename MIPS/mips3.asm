.data
number: .word 2         # Definimos un número que vamos a cuadrar
message: .asciiz "El cuadrado es: "  # Mensaje para imprimir antes del resultado

.text
.globl main

main:
    lw $a0, number     # Cargamos el valor de 'number' en $a0
    jal square         # Llamamos a la función 'square'

    # Guardamos el resultado en un registro temporal
    move $t0, $v0      # Mover el resultado a $t0 para preservarlo

    # Imprimir el mensaje "El cuadrado es: "
    li $v0, 4          # Syscall para imprimir cadena
    la $a0, message    # Cargar la dirección del mensaje en $a0
    syscall            # Llamamos a la syscall

    # Imprimir el resultado (el cuadrado calculado)
    li $v0, 1          # Syscall para imprimir entero
    move $a0, $t0      # Mover el resultado almacenado en $t0 a $a0
    syscall            # Llamamos a la syscall
    
    # Finalizar el programa
    li $v0, 10         # Syscall para salir
    syscall            # Llamamos a la syscall para terminar el programa
    
    # Función: square
    # Propósito: Calcular el cuadrado de un número
    # Argumento: $a0 (el número a cuadrar)
    # Retorno: $v0 (el cuadrado del número)
    square:
        mul $v0, $a0, $a0  # Multiplica $a0 por sí mismo y almacena el resultado en $v0
        jr $ra             # Retorna a la dirección almacenada en $ra


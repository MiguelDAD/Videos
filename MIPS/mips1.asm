.data
    # Definir un array de enteros
    array:      .word  1, 2, 3, 4, 5      # Array con 5 elementos
    array_size: .word  5                  # Tamaño del array
    threshold:  .word  15                # Valor umbral para comparar la suma
    sum:        .word  0                  # Variable para almacenar la suma
    mensaje_menor: .asciiz "La suma es menor que el umbral."
    
.text
.globl main
main:
    # Inicializar registros
    la $t0, array           # Cargar la dirección base del array en $t0
    lw $t1, array_size      # Cargar el tamaño del array en $t1
    li $t2, 0               # Inicializar el índice del array a 0 en $t2
    li $t3, 0               # Inicializar suma a 0 en $t3

loop:
    # Condición de salida del bucle
    beq $t2, $t1, end_loop  # Si $t2 == $t1, salir del bucle

    # Cargar el valor actual del array
    lw $t4, 0($t0)          # Cargar el valor de array[$t2] en $t4
    add $t3, $t3, $t4       # Sumar el valor actual a la suma total

    # Avanzar al siguiente elemento
    addi $t0, $t0, 4        # Avanzar el puntero del array (4 bytes por palabra)
    addi $t2, $t2, 1        # Incrementar el índice del array

    # Volver al inicio del bucle
    j loop

end_loop:
    # Guardar el resultado de la suma en la variable sum
    la $t5, sum             # Cargar la dirección de la variable sum en $t5
    sw $t3, 0($t5)          # Guardar la suma en la dirección de sum

    # Comparar la suma con el umbral
    la $t6, threshold       # Cargar la dirección de threshold en $t6
    lw $t7, 0($t6)          # Cargar el valor de threshold en $t7
    ble $t3, $t7, less_than # Si suma < umbral, ir a less_than
	
    # Si la suma es mayor o igual al umbral
    li $v0, 1               # Código de syscall para imprimir entero
    move $a0, $t3           # Mover el valor de la suma a $a0
    syscall                 # Llamar a la syscall

    j end                   # Ir al final del programa

less_than:
    # Si la suma es menor que el umbral
    li $v0, 4               # Código de syscall para imprimir cadena
    la $a0, mensaje_menor   # Cargar la dirección del mensaje en $a0
    syscall                 # Llamar a la syscall

end:
    li $v0, 10              # Código de syscall para salir del programa
    syscall                 # Llamar a la syscall



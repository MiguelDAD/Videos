.data
    array:  .space 20  # Reservar 20 bytes (5 palabras de 4 bytes cada una) para el array
    size:   .word  5   # Tama�o del array
    space:  .asciiz " "        # Cadena que representa un espacio
    
.text
.globl main
main:
    # Inicializar registros para llenar el array
    la   $t0, array      # Cargar la direcci�n base del array en $t0
    lw   $t1, size       # Cargar el tama�o del array en $t1
    li   $t2, 1          # Inicializar el valor a 1
    li   $t3, 0          # Inicializar �ndice del array a 0
    
fill_array:
    # Condici�n de salida del bucle
    beq  $t3, $t1, end_fill  # Si $t3 == $t1, salir del bucle

    # Almacenar el valor en el array
    sw   $t2, 0($t0)      # Guardar el valor de $t2 en la posici�n array[$t3]

    # Avanzar al siguiente elemento
    addi $t0, $t0, 4      # Avanzar el puntero del array (4 bytes por palabra)
    addi $t2, $t2, 1      # Incrementar el valor a almacenar
    addi $t3, $t3, 1      # Incrementar el �ndice del array

    # Volver al inicio del bucle
    j    fill_array

end_fill:
    # Imprimir todo el array
    la   $t0, array       # Reiniciar el puntero del array a la posici�n base
    li   $t3, 0           # Reiniciar el �ndice del array a 0

print_array:
    # Condici�n de salida del bucle
    beq  $t3, $t1, end_print  # Si $t3 == $t1, salir del bucle

    # Cargar el valor actual del array
    lw   $a0, 0($t0)      # Cargar el valor de array[$t3] en $a0

    # Imprimir el valor
    li   $v0, 1           # C�digo de syscall para imprimir entero
    syscall               # Llamar a la syscall

    # Imprimir un espacio
    li   $v0, 4           # C�digo de syscall para imprimir cadena
    la   $a0, space       # Cargar la direcci�n del espacio en $a0
    syscall               # Llamar a la syscall

    # Avanzar al siguiente elemento
    addi $t0, $t0, 4      # Avanzar el puntero del array (4 bytes por palabra)
    addi $t3, $t3, 1      # Incrementar el �ndice del array

    # Volver al inicio del bucle
    j    print_array

end_print:
    # Fin del programa
    li   $v0, 10          # C�digo de syscall para salir del programa
    syscall               # Llamar a la syscall



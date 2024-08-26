#include <stdio.h>

int main() {
    // Reservar espacio para un array de 5 enteros
    int array[5];          // Array de 5 elementos
    int size = 5;          // Tamaño del array

    // Inicializar variables para llenar el array
    int value = 1;         // Inicializar el valor a 1
    int i;

    // Llenar el array con valores del 1 al 5
    for (i = 0; i < size; i++) {
        array[i] = value;
        value++;
    }

    // Imprimir todo el array
    for (i = 0; i < size; i++) {
        printf("%d ", array[i]);  // Imprimir el valor seguido de un espacio
    }

    printf("\n");  // Imprimir un salto de línea al final

    return 0;
}

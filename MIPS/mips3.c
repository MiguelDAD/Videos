#include <stdio.h>

// Función que calcula el cuadrado de un número
int square(int x) {
    return x * x;
}

int main() {
    int number = 5;  // Definimos el número que vamos a cuadrar
    int result;

    // Llamamos a la función 'square' y almacenamos el resultado
    result = square(number);

    // Imprimimos el mensaje y el resultado
    printf("El cuadrado es: %d\n", result);

    return 0;  // Terminamos el programa
}

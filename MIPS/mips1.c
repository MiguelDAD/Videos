#include <stdio.h>

int main() {
    // Definir un array de enteros
    int array[] = {1, 2, 3, 4, 5};    // Array con 5 elementos
    int array_size = 5;               // Tamaño del array
    int threshold = 20;               // Valor umbral para comparar la suma
    int sum = 0;                      // Variable para almacenar la suma

    // Inicializar índice
    int i;

    // Loop para calcular la suma de los elementos del array
    for (i = 0; i < array_size; i++) {
        sum += array[i];
    }

    // Comparar la suma con el umbral
    if (sum < threshold) {
        printf("La suma es menor que el umbral.\n");
    } else {
        printf("La suma es: %d\n", sum);
    }

    return 0;
}

#include <stdio.h>

extern int suma(int a, int b);

int main() {
	int resultado = suma(3, 4);
	printf("El resultado de la suma es: %d\n", resultado);
	return 0;
}
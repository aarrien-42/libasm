#include <stdio.h>

extern int ft_strlen(char* str);

int main() {
	int resultado = ft_strlen("Hola");
	printf("El resultado de la ft_strlen es: %d\n", resultado);
	return 0;
}
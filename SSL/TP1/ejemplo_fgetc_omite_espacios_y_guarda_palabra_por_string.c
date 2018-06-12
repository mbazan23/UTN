#include <stdio.h>
#include <stdlib.h>

void limpiarString(char string[]);

int main()
{
	FILE *archivo;
	char caracter;
	char palabra[30];
	archivo = fopen("prueba.txt","r");
	
	if (archivo == NULL)
        {
            printf("\nError de apertura del archivo. \n\n");
        }
        else
        {
            printf("\nEl contenido del archivo de prueba es \n\n");
            caracter = fgetc(archivo);
            int indice = 0;
            while(caracter != EOF)
			{
				if (caracter == ' ') 
				{ 
					printf ("\n %s", palabra);
					limpiarString(palabra);
				    caracter = fgetc(archivo);
				    indice = 0;
				}
				
				/* printf("%c",caracter);*/
				palabra[indice] = caracter;
				caracter = fgetc(archivo);
				indice++;
				
				if (caracter == EOF){ printf ("\n %s", palabra);}
				
			}
        }	
        fclose(archivo);
	return 0;
} 




void limpiarString(char string[])
{
	 for (int j=0; j<30; j++) {string[j]=' ';}	
}




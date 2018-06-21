#include <stdio.h>
#include <stdlib.h>


void limpiarString(char string[]);
int digitoDecimal (char letra);
int digitoOctal (char letra);
int digitoHexadecimal (char letra);
char* analizadorSintactico(char* palabra);
	
int main()
{
	FILE *archivoDeEntrada = fopen("prueba.txt","r");
	FILE *archivoDeSalida= fopen("salida.txt","w");
	char caracter;
	char palabra[10];

	limpiarString(palabra);

	
	if (archivoDeEntrada == NULL)
        {
            printf("\nError de apertura del archivo de Entrada. \n\n");
        }
        else
        {
            fprintf(archivoDeSalida,"\nEl contenido del archivo de prueba es \n\n");
            caracter = fgetc(archivoDeEntrada);
            int indiceDePalabra = 0;
            while(caracter != EOF)
			{
				if (caracter == ' ') 
				{ 
					char* tipoDeDatoDeLaPalabra = analizadorSintactico(palabra);
					fprintf (archivoDeSalida,"\n %s   %s", palabra,tipoDeDatoDeLaPalabra);
					limpiarString(palabra);
			        caracter = fgetc(archivoDeEntrada);
				    indiceDePalabra = 0;
				}
				
				palabra[indiceDePalabra] = caracter;
				caracter = fgetc(archivoDeEntrada);
				indiceDePalabra++;
				
				if (caracter == EOF)
				{
					char* tipoDeDatoDeLaPalabra = analizadorSintactico(palabra);
					fprintf (archivoDeSalida,"\n %s   %s", palabra,tipoDeDatoDeLaPalabra);
					limpiarString(palabra);
				}
				
			}
        }	
        fclose(archivoDeEntrada);
	return 0;
} 


char* analizadorSintactico(char string[]){
	char *estado;

	if (digitoDecimal(string[0]) ) {
		estado = "Decimal";
		int k=1;
		while( (string[k]!= '\0') | (digitoDecimal(string[k])) )
		{
			if( !digitoDecimal(string[k]) ){
				estado= "No se reconoce tipo de Dato"; 
				if  (string[k]=='0'){estado="Decimal";}
				break;}
			k++;
		}
	}	
	if (string[0] == '0' && string [1] =='X' ) {
		estado = "Hexadecimal";
		int k=2;
		while( (string[k]!= '\0') | (digitoHexadecimal(string[k]) ) )
		{
			if( !digitoHexadecimal(string[k]) ){estado= "No se reconoce tipo de Dato"; break;}
			k++;
		}	
	}
	
	if (string[0] == '0' && digitoOctal(string[1]) ) {
		estado = "Octal";
		int k=2;
		while((string[k]!= '\0') | (digitoOctal(string[k])) )
		{
			if( !digitoOctal(string[k]) ){estado= "No se reconoce tipo de Dato"; break;}
			k++;
		}
	}

	if (estado != "Decimal" & estado!="Hexadecimal" & estado!="Octal" ) {estado= "No se reconoce tipo de Dato";}
 
    return estado;    	
}	



int digitoDecimal (char letra){
		if (letra == '0' | letra == '2' | letra == '3' | letra == '4' | letra == '5' | letra == '6' | letra == '7' | letra == '8' | letra == '9' | letra==' '| letra=='1' ){
			return 1;}
		else return 0;	  
	}
	
int digitoOctal (char letra){
	if (letra == '1' | letra == '2' | letra == '3' | letra == '4' | letra == '5' | letra == '6' | letra == '7'|letra==' '){
		return 1;}
	else return 0;	  
}

int digitoHexadecimal (char letra){
	if (letra == '1' |letra == '2' | letra == '3' | letra == '4' | letra == '5' | letra == '6' | letra == '7' | letra == '8' |letra == '9' | letra == 'A' | letra == 'B' | letra == 'C'| letra == 'D' | letra == 'E' | letra == 'F' |letra==' ' |letra == 'a' | letra == 'b' | letra == 'c' | letra == 'd'| letra == 'e' | letra == 'f' ){
		return 1;}
	else return 0;	  
}

	



void limpiarString(char string[])
{
	 for (int j=0; j<11; j++) 
	 {
		
		string[j]=' ';
	 }	 	
}




#include <stdio.h>

int esDecimal (char letra);
int esOctal (char letra);
int esHexadecimal (char letra);
char* analizadorSintactico(char* palabra);
	
	
int main(void){
	char* palabra= "01234";
	char *estado;
	
	if (palabra[0] == '0' && palabra [1] =='X' ) {
		estado = "Hexadecimal";
		int k=2;
		while(palabra[k]!= '\0' | esHexadecimal(palabra[k]))
		{
			if( !esHexadecimal(palabra[k]) ){estado= "No se reconoce Palabra"; break;}
			k++;
		}
		
	}
	
	if (palabra[0] == '0' && esOctal(palabra[1]) ) {
		estado = "Octal";
		int k=2;
		while(palabra[k]!= '\0' | esOctal(palabra[k]))
		{
			if( !esOctal(palabra[k]) ){estado= "No se reconoce Palabra"; break;}
			k++;
		}
	}
	
	
    if (esDecimal(palabra[0]) ) {
		 estado = "Decimal";
		 int k=1;
		while(palabra[k]!= '\0' | esDecimal(palabra[k]))
		{
			if( !esDecimal(palabra[k]) ){estado= "No se reconoce Palabra"; break;}
			k++;
		}
	}	
    
    
    
    printf("Tu palabra es del tipo : %s", estado);
    
}


char* analizadorSintactico(char* palabra){
	char *estado;
	
if (palabra[0] == '0' && palabra [1] =='X' ) {
		estado = "Hexadecimal";
		int k=2;
		while(palabra[k]!= '\0' | esHexadecimal(palabra[k]))
		{
			if( !esHexadecimal(palabra[k]) ){estado= "No se reconoce Palabra"; break;}
			k++;
		}
		
	}
	
	if (palabra[0] == '0' && esOctal(palabra[1]) ) {
		estado = "Octal";
		int k=2;
		while(palabra[k]!= '\0' | esOctal(palabra[k]))
		{
			if( !esOctal(palabra[k]) ){estado= "No se reconoce Palabra"; break;}
			k++;
		}
	}
	
	
    if (esDecimal(palabra[0]) ) {
		 estado = "Decimal";
		 int k=1;
		while(palabra[k]!= '\0' | esDecimal(palabra[k]))
		{
			if( !esDecimal(palabra[k]) ){estado= "No se reconoce Palabra"; break;}
			k++;
		}
	}	
    
    
    
    return estado;
    	
}	



int esDecimal (char letra){
		if (letra == '1' | letra == '2' | letra == '3' | letra == '4' | letra == '5' | letra == '6' | letra == '7' | letra == '8' | letra == '9' ){
			return 1;}
		else return 0;	  
	}
	
	int esOctal (char letra){
		if (letra == '1' | letra == '2' | letra == '3' | letra == '4' | letra == '5' | letra == '6' | letra == '7'){
			return 1;}
		else return 0;	  
	}
	
	int esHexadecimal (char letra){
		if (letra == '1' | letra == '2' | letra == '3' | letra == '4' | letra == '5' | letra == '6' | letra == '7' | letra == '8' | letra == '9' | letra == 'A' | letra == 'B' | letra == 'C'| letra == 'D' | letra == 'E' | letra == 'F'  ){
			return 1;}
		else return 0;	  
	}
	
		

#include <stdio.h>


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
	
		
	
	
	
int main(void){
	char palabra[6]= "01234";
	char *estado;
	
	if (palabra[0] == '0' && palabra [1] =='X' ) {
		estado = "Hexadecimal";
	}
	
	if (palabra[0] == '0' && esOctal(palabra[1]) ) {
		estado = "Octal";
	}
	
	
    if (esDecimal(palabra[0]) ) {
		 estado = "Decimal";
	}	
    
    
    
    printf("Tu palabra es del tipo : %s", estado);
    
}

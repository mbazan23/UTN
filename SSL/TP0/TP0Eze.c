#include <stdio.h>

void longitud (char[]);
void cadenaVacia (char[]);
void concatenar (char[], char[], char []);

//[]{}
int main()
{
    char cadena1[30], cadena2[30], cadenaConcatenada[60];

    for(int i=0;i<30;i++)
        cadena1[i]='\0';

    for(int i=0;i<30;i++)
        cadena2[i]='\0';

    for(int i=0;i<60;i++)
        cadenaConcatenada[i]='\0';

    printf("Ingrese una cadena de hasta 30 caracteres, a continuacion se mostrara su longitud...\n");
    fgets(cadena1,30,stdin);
    longitud(cadena1);

    printf("Ingrese una cadena y se determinara si esta vacia...\n");
    fgets(cadena2,30,stdin);
    cadenaVacia(cadena2);

    printf("A continuacion se concatenaran las dos cadenas anteriores y se mostraran por pantalla...\n");
    concatenar(cadena1, cadena2, cadenaConcatenada);
    printf("\n");

    return 0;
}

//[]{}
void longitud (char cadena[])
{
        int i=0;
        while(cadena[i]!='\n')
            {
            i++;
            }
        printf("La cadena tiene longitud: %d\n", i);
}

//[]{}
void cadenaVacia (char cadena2[30])
{
        if(cadena2[0]=='\n')
            printf("La cadena esta vacia.\n");
        else
            printf("La cadena NO esta vacia.\n");
}

//[]{}
void concatenar (char cadena1[30], char cadena2[30], char cadenaConcatenada[60])
{
    int rTotal = 0; //El que recorre la concatenada
    int r1 = 0; //El que reorre la primera
    int r2 = 0; //El que recorre la segunda

    while(cadena1[r1]!='\n')
        {
            cadenaConcatenada[rTotal] = cadena1[r1];
            rTotal++;
            r1++;
        }

    while(cadena2[r2]!='\n')
        {
            cadenaConcatenada[rTotal] = cadena2[r2];
            rTotal++;
            r2++;
        }

    int i = 0;

    while(cadenaConcatenada[i]!='\0')
        {
            printf("%c",cadenaConcatenada[i]);
            i++;
        }
}

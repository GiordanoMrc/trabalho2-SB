#include <stdio.h>

/** 
* Macro em NASM: Comando "FOR"
* 
* Rafael Dias da Costa 12/0133253
*
* Arquivo nasm: for.asm
**/

void forSB(int a,int b,int c);

int main(void){


	/* ---------- Testando macro FOR ------------ */
	int valorInicial = 15;
	int valorFinal =  10;
	int flagIncremento = 0;


	printf("\nSimulando: for(i=%d; i => %d; i--)\n", valorInicial,valorFinal);

	forSB(valorInicial,valorFinal,flagIncremento);


	valorInicial = 0;
	valorFinal = 3;
	flagIncremento = 1;

    printf("\nSimulando: for(i=%d; i < %d; i++)\n", valorInicial,valorFinal);

	forSB(valorInicial,valorFinal,flagIncremento);

	/* ---------- Testando macro FOR ------------ */

	return 0;
}
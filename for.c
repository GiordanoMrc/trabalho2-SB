#include <stdio.h>

/** 
* Macro em NASM: Comando "F"OR"
* 
* Rafael Dias da Costa 12/0133253
*
* Arquivo nasm: for.asm
**/

int forSB(int a,int b,int c);

int main(void){


	/* ---------- Testando macro FOR ------------ */
	int valorInicial = 0;
	int valorFinal =  10;
	int flagIncremento = 1;

	int retornofor = forSB(valorInicial,valorFinal,flagIncremento);
	printf("%d iterações! Valor inicial: %d, Valor Final: %d\n",retornofor,valorInicial,valorFinal);
	/* ---------- Testando macro FOR ------------ */

	return 0;
}
#include <stdio.h>
#include <stdlib.h>

int asm_main( );

/* 
*	Álvaro Torres Vieira
*	14/0079661
*	Arquivo NASM: while_do.asm
*/


int main()
{
  int ret_status;
  printf("Função: \nWhile (x == 10 > 0)\ndo\n{\n y = 1 + 2 \n}\n");
  ret_status = asm_main();
  printf("Resultado: %d\n",ret_status);
  return ret_status;
}

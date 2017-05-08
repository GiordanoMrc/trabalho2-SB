#include "cdecl.h"
#include <stdio.h>
//int PRE_CDECL asm_main( void ) POST_CDECL; < Eh necessario?

int forSB(int a,int b,int c);

int switchSB();

int doWhileSB();

int ifElseSB();

int main()
{
  int ret_status;

  /* ----- Testando macro IF-ELSE ----- */
  printf(" ----- Testando macro IF-ELSE ----- \n");
  ret_status = ifElseSB();
  getchar();

  /* ----- Testando macro SWITCH  ----- */
  printf(" ----- Testando macro SWITCH ----- \n");
  ret_status = switchSB();
  getchar();
  /* ----- Testando macro DO-WHILE ----- */
  printf(" ----- Testando macro DO-WHILE ----- \n");
  ret_status = doWhileSB();
  printf("\n");
  getchar();
  /* ----- Testando macro FOR ----- */
  printf(" ----- Testando macro FOR ----- \n");
  /* for(int i = 0; i < 5; i++) */
  ret_status = forSB(0,5,1);
  getchar();

  return ret_status;
}

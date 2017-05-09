#include <stdio.h>

int forSB(int a,int b,int c);

int switchSB();

int doWhileSB();

int ifElseSB();

int whileDoSB();

void espera(){
  printf("Pressione ENTER para continuar...\n");
  getchar();
}

int main()
{
  int ret_status;

  /* ----- Testando macro IF-ELSE ----- */
  printf(" ----- Testando macro IF-ELSE ----- \n");
  ret_status = ifElseSB();
  printf(" ----- Fim teste macro IF-ELSE ----- \n");
  espera();

  /* ----- Testando macro SWITCH  ----- */
  printf(" ----- Testando macro SWITCH ----- \n");
  ret_status = switchSB();
  printf(" ----- Fim teste macro SWITCH ----- \n");
  espera();

  /* ----- Testando macro WHILE-DO ----- */
  printf(" ----- Testando macro WHILE-DO ----- \n");
  printf("Função: \nWhile (x == 10 > 0)\ndo\n{\n y = 1 + 2 \n}\n");
  ret_status = whileDoSB();
  printf("Resultado: %d\n",ret_status);
  printf(" ----- Fim teste macro WHILE-DO ----- \n");
  espera();

  /* ----- Testando macro DO-WHILE ----- */
  printf(" ----- Testando macro DO-WHILE ----- \n");
  ret_status = doWhileSB();
  printf("\n");
  printf(" ----- Fim teste macro DO-WHILE ----- \n");
  espera();

  /* ----- Testando macro FOR ----- */
  printf(" ----- Testando macro FOR ----- \n");
  printf("Teste :  for(int i = 0; i < 5; i++) [5 iteracoes esperadas] \n");
  ret_status = forSB(0,5,1);
  printf("Teste :  for(int i = 10; i > 7; i--) [3 iteracoes esperadas]\n");
  ret_status = forSB(10,7,0);
  printf(" ----- Fim teste macro FOR ----- \n");
  espera();

  return ret_status;
}

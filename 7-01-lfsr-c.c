/*

  Grupo 7

  Implementação do gerador de números aleatórios com LFSR e
  cálculo do chi-quadrado

  Jefferson Viana Fonseca Abreu
  13/0028959

  Rafael Dias da Costa
  12/0133253


  Comando para compilacao: gcc 7-01-lfsr-c.c -o lfsr -g -lm

*/

#include <stdint.h>
#include <stdio.h>
#include <math.h>
#define NN 4096

//vetor de classes
int classes[NN];
double chiQuad[NN];
double distChi = 0;

//declarações de funções
void inicializaClasses();
void inicializaChiQuad();
void calcFreq();
void separaClasses(uint32_t);
void lfsr();

//corpo das funções
void inicializaClasses(){
  for (int i = 0;  i < NN; i++) {
    classes[i] = 0;
  }
}

void inicializaChiQuad() {
  for (int i = 0;  i < NN; i++) {
    chiQuad[i] = 0;
  }
 }

void separaClasses(uint32_t a) {
  uint32_t aux = (a/NN);
  classes[aux]++;
}

void calcFreq(){
  double aux =0;

  for (int i = 0;  i < NN; i++) {
    aux = (pow((classes[i]-NN),2))/NN;
    chiQuad[i] = aux;

    distChi += chiQuad[i];
  }
}
/*
função que gera os números pseudo aleatórios adaptada de:
https://en.wikipedia.org/wiki/Linear-feedback_shift_register
*/
void lfsr(){
  uint32_t start_state = 0xFF01;  /* Any nonzero start state will work. */
  uint32_t lfsr = start_state;
  uint32_t bit;                    /* Must be 16bit to allow bit<<15 later in the code */
  unsigned period = 0;

  unsigned long int contador = 0;

  do
  {
      /* taps: 16 14 13 11; feedback polynomial: x^16 + x^14 + x^13 + x^11 + 1 */
      bit  = ((lfsr >> 0) ^ (lfsr >> 2) ^ (lfsr >> 3) ^ (lfsr >> 5) ^ (lfsr >> 8) ^(lfsr >> 13) ^(lfsr >> 21)) & 1;
      lfsr =  (lfsr >> 1) | (bit << 23);
      ++period;
      contador++;
      lfsr = lfsr & 0x00FFFFFF;
      separaClasses(lfsr);
  } while (/*lfsr != start_state && */contador != 16777215);

  printf("\n\n\t gerou %lu números\n",contador);



}

int main(void){
  inicializaChiQuad();
  inicializaClasses();
  lfsr();
  calcFreq();
  for (int i = 0; i < NN; i++) {
    printf("classe %d tem %d elementos e o valor chi da classe %d é %lf\n",i,classes[i],i,chiQuad[i]);
  }

  printf("\tvalor chi quadrado é %lf\n", distChi);

  getchar();
  return 0;
}

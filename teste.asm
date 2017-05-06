%include "asm_io.inc"

section .dat
  ;declaração e inicialização de dados
  text dw "oi",0
section .bss
  ;declaração sem inicialização das informações que serão usadas

section .text
  ;o programa começa a rodar aqui, a partir da _start

global asm_main
asm_main:
  mov eax , text
  call print_string
;o programa começa a rodar aqui, a partir daqui

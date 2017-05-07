; file: switchcase.asm
; macro que simula o comando do-while do C

%include "asm_io.inc"

; do-while
; executa um corpo da macro e verifica se uma condição é verdadeira
; caso seja executa o corpo de novo
%macro doWhile 0
	%push cntxdo ;empilha o contexto do do
	%$startloop:
%endmacro

%macro endDoWhile 1
	cmp %1,0
	jnz %$startloop ;verifica se o parametro ainda é verdadeiro
	                 ;se for itera de novo
	%pop             ; se nao, termina a iteracao
%endmacro

section .dat
msg_teste1 db 'testetetstet',0

segment .bss
;
; uninitialized data is put in the bss segment
;

segment .text
  global  asm_main
	asm_main:
	enter	0,0               ; setup routine
	pusha
;
; code is put in the text segment. Do not modify the code before
; or after this comment.
;

mov eax, msg_teste1
call print_string

mov ecx, 10

doWhile
	mov eax, ecx
	call print_int
	sub ecx, 1
endDoWhile ecx

popa
mov	eax, 0
leave
ret

; GRUPO 7
; 
; MACRO: WHILE_DO
;
; ÁLVARO TORRES VIEIRA
; 14/0079661
;
; ARQUIVO PARA TESTE: while_do.c
;

%macro while_do 1

	cmp %1, 0

	jnz addb			; vai para a função se $1 for verdadeiro
	jmp fim				; vai para o fim se $1 for falso

%endmacro


segment .data

a:	dd	1
b:	dd	2

segment .bss
c:	resd	1


segment .text

	global _asm_main

	_asm_main:
	enter 0,0
	pusha
;
;

mov ebx, 10						; interação do será feita 10 vezes

while_do ebx						; chama o primeiro loop

addb:				; c=a+b;
	mov	eax,[a]	 	; load a
	add	eax,[b]		; add b
	add	[c],eax		; store into c

sub ebx, 1 							; subtrai 1 após a função ser executada
while_do ebx						; volta pro loop

;
;
fim:
	popa
	mov eax, [c]
	leave
	ret


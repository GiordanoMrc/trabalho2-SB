; file: switchcase.asm
; macro que simula o comando do-while do C

%include "asm_io.inc"

; do-while
; executa um corpo da macro e verifica se uma condição é verdadeira
; caso seja executa o corpo de novo

%macro DO 0
	%push cntxswitch
	%assign %$casenum 1
		mov eax, %1
		jmp %$case%$casenum
%endmacro

; CASE
; parametro: (1) valor a ser comparado com o passado ao switch
; verifica se contexto cntxswitch foi criado
; incrementa numero do caso e pula para o próximo
; verifica se condição do caso é satisfeita
; avança para o proximo caso se condição não for satisfeita
%macro CASE 1
	%ifctx cntxswitch
		%$case%$casenum:
			cmp eax, %1
			%assign %$casenum %$casenum+1
			jne %$case%$casenum
	%endif
%endmacro

; DEFAULT
; parametro: não possui
; verifica se contexto cntxswitch foi criado
; usando quando nenhum outro caso satisfaz a condição requerida
%macro DEFAULT 0
	%ifctx cntxswitch
		%$case%$casenum:
	%endif
%endmacro

; BREAK
; parametro: não possui
; verifica se contexto cntxswitch foi criado
; ocorre ao final de um caso
; pula para o final do switch (ENDSWITCH)
	%macro BREAK 0
	%ifctx cntxswitch
		jmp %$endswitch
	%endif
%endmacro

; ENDSWITCH
; parametro: não possui
; verifica se contexto cntxswitch foi criado
; desempilha contexto do switch (cntxswitch)
%macro ENDSWITCH 0
	%ifctx cntxswitch
		%$endswitch:
			%pop cntxswitch
	%endif
%endmacro

segment .data
;
; initialized data is put in the data segment here
;
; mensagens que serão mostradas ao entrar em cada caso
caso1_msg 		db "CASO 1", 0xa, 0
caso2_msg 		db "CASO 2", 0xa, 0
caso3_msg 		db "CASO 3", 0xa, 0
deflt_msg 		db "DEFAULT", 0xa, 0

msg_teste1 		db "Caso esperado: CASO 1", 0xa, 0
msg_teste2 		db "Caso esperado: CASO 2", 0xa, 0
msg_teste3 		db "Caso esperado: CASO 3", 0xa, 0
msg_teste4 		db "Caso esperado: DEFAULT", 0xa, 0

; valores que determinarão qual caso terá sua condição satisfeita
valor1	equ 100
valor2	equ 111
valor3	equ 101
valor0	equ 000

v_caso1	equ 100
v_caso2	equ 111
v_caso3	equ 101

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

	SWITCH valor1
	CASE v_caso1
		mov eax, caso1_msg
		call print_string
		BREAK
	CASE v_caso2
		mov eax, caso2_msg
		call print_string
		BREAK
	CASE v_caso3
		mov eax, caso3_msg
		call print_string
		BREAK
	DEFAULT
		mov eax, deflt_msg
		call print_string
		BREAK
	ENDSWITCH

	mov eax, msg_teste2
	call print_string

	SWITCH valor2
	CASE v_caso1
		mov eax, caso1_msg
		call print_string
		BREAK
	CASE v_caso2
		mov eax, caso2_msg
		call print_string
		BREAK
	CASE v_caso3
		mov eax, caso3_msg
		call print_string
		BREAK
	DEFAULT
		mov eax, deflt_msg
		call print_string
		BREAK
	ENDSWITCH

	mov eax, msg_teste3
	call print_string

	SWITCH valor3
	CASE v_caso1
		mov eax, caso1_msg
		call print_string
		BREAK
	CASE v_caso2
		mov eax, caso2_msg
		call print_string
		BREAK
	CASE v_caso3
		mov eax, caso3_msg
		call print_string
		BREAK
	DEFAULT
		mov eax, deflt_msg
		call print_string
		BREAK
	ENDSWITCH

	mov eax, msg_teste4
	call print_string

	SWITCH valor0
	CASE v_caso1
		mov eax, caso1_msg
		call print_string
		BREAK
	CASE v_caso2
		mov eax, caso2_msg
		call print_string
		BREAK
	CASE v_caso3
		mov eax, caso3_msg
		call print_string
		BREAK
	DEFAULT
		mov eax, deflt_msg
		call print_string
		BREAK
	ENDSWITCH

    popa
    mov	eax, 0
    leave
    ret

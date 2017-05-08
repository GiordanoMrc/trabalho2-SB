%include "asm_io.inc"

; IF
; Macro principal do if, recebe como parametro a condicao
; se a condicao for diferente de 0 ira executar o codigo
; do bloco if caso contrario ira pular para o else
%macro IF_ 1
	%push contextif
	mov eax, 0
	cmp eax, %1
	je %$elsecondition
%endmacro

; Quando essa macro eh chamada, pula para o final do if
; ela deve ser chamada logo apos o if e antes do else
; para que caso a conficao do if seja verdadeira
; o bloco seja finalizado
%macro BREAK_IF 0
	%ifctx contextif
		jmp %$finish_if
	%endif
%endmacro

; Marca o final do bloco if
; pop no contexto do bloco
%macro END_IF 0
	%ifctx contextif
		%$finish_if:
		%pop contextif
	%endif
%endmacro

; Clausula else, sera executada caso a condicao do if seja 0
%macro ELSE_ 0
	%ifctx contextif
		%$elsecondition:
	%endif
%endmacro


segment .data

caso_true	db "Condicao verdadeira!", 0xa, 0
caso_false	db "Condicao falsa!", 0xa, 0

msg_teste_true	db "Caso esperado: True", 0xa, 0
msg_teste_false db "Caso esperado: False", 0xa, 0

valor_true 	equ 1
valor_false 	equ 0

segment .bss

segment .text
	global ifElseSB
ifElseSB:
	enter 0,0
	pusha

	mov eax, msg_teste_true
	call print_string

	IF_ valor_true ; Chamando a macro
		mov eax, caso_true
		call print_string
	BREAK_IF ; Se a condicao for verdadeira essa macro pula para o fim do bloco
	ELSE_ ; Se a condicao for falsa executa o bloco else
		mov eax, caso_false
		call print_string
	END_IF ; Fim do if/else

	mov eax, msg_teste_false
	call print_string

	IF_ valor_false
		mov eax, caso_true
		call print_string
	BREAK_IF
	ELSE_
		mov eax, caso_false
		call print_string
	END_IF


	popa
	mov eax, 0
	leave
	ret

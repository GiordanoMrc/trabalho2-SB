; Grupo 7
; 
; Rafael Dias da Costa 12/0133253
;
; Macro "FOR" em NASM.
;
; Arquivo para teste em C: for.c
;
; Comando para gerar objeto: nasm -f elf -d ELF_TYPE for.asm   (Para Linux, desenvolvido em Ubuntu 16.04)
;


%include "asm_io.inc"		; inclusão da biblioteca de I/O do Carter 

%macro for 1 				; Macro de início da iteração
	%push for    			; executa o push da macro
	j%-1 %$endloop  		; como argumento eh nz, monta 'jnz endloop'
	%$startloop:  			; inicia corpo do for
%endmacro


; Macro de verificação de fim de interação
%macro endfor 0
	jnz %$startloop  		; verifica se deve continuar iteracoes
	%$endloop:       		; se nao, termina a iteracao
	%pop             		; remove da pilha 
%endmacro

global forSB	 			; declaracao do nome da macro na interface C

section .data

; mensagens que serao mostrada a cada iteracao (iteracao_msg) e ao fim (total_msg)
iteracao_msg 		db "(Executando iteracao)", 0xa, 0
total_msg 		db " iteracoes executadas no total", 0xa, 0

	section .text

	forSB:

	enter	0,0             ; setup routine
 	pusha

	mov eax, iteracao_msg   ; mensagem de iteracao
	mov edx,[ebp+8]   		; captura do argumento 1
	mov ebx,[ebp+12]   		; captura do argumento 2 (Numero de iterações desejada)
	mov ecx,[ebp+16]  		; captura do argumento 3 (Passo da iteração, Diferente de 0 = passo incremental, Igual a 0 = decremental)
	mov edi, 0
	cmp edx,ebx       

	for nz            		; chama a macro 'for' declarada na linha 10
		cmp ecx,0     		; compara argumento de passo com 0

		jz decr       		; caso for == 0, passo decrementa. Se == 1, segue incrementando

		incr: inc edx 		; incrementa eax

		jmp verifica  		; pula para label 'verifica'

		decr: dec edx 		; decrementa eax

		verifica:     		; label que verifica situação da condição de parada
		call print_string 	; imprime na tela a cada iteracao
		inc edi            	; incrementa o registrador contador de iteracoes
		cmp edx,ebx   		; condicao de parada

	endfor            		; chama a macro 'endfor' declarada na linha 18
	mov eax, edi
	call print_int    		; imprime na tela o total de iteracoes
	mov eax, total_msg  	; imprime na tela a cada iteracao
	call print_string

	popa  					; pop routine
    mov	eax, 0
    leave

	ret               		; retorna ao programa C


%include "asm_io.inc"

; Macro de início da iteração
%macro for 1
	%push for    			; executa o push da macro
	j%-1 %$endloop  		; como argumento eh nz, monta 'jnz endloop'
	%$startloop:  			; inicia corpo do for
%endmacro


; Macro de verificação de fim de interação
%macro endfor 0
<<<<<<< HEAD
	jnz %$startloop  ; verifica se deve continuar iteracoes
	%$endloop:       ; se nao, termina a iteracao
	%pop             ; remove da pilha
=======
	jnz %$startloop  		; verifica se deve continuar iteracoes
	%$endloop:       		; se nao, termina a iteracao
	%pop             		; remove da pilha 
>>>>>>> 1022f932949b01ccc478c90c213546ee7481bd9b
%endmacro

global forSB	 			; declaracao do nome da macro na interface C

section .data

; mensagens que serao mostrada a cada iteracao (iteracao_msg) e ao fim (total_msg)
iteracao_msg 		db "(Executando iteracao)", 0xa, 0
total_msg 		db " iteracoes executadas no total", 0xa, 0

	section .text

	forSB:
<<<<<<< HEAD
	mov eax,[esp+4]   ; captura do argumento 1
	mov ebx,[esp+8]   ; captura do argumento 2 (Numero de iterações desejada)
	mov ecx,[esp+12]  ; captura do argumento 3 (Passo da iteração, Diferente de 0 = passo incremental, Igual a 0 = decremental)

	cmp eax,ebx
=======
	mov eax, iteracao_msg   ; mensagem de iteracao
	mov edx,[esp+4]   		; captura do argumento 1
	mov ebx,[esp+8]   		; captura do argumento 2 (Numero de iterações desejada)
	mov ecx,[esp+12]  		; captura do argumento 3 (Passo da iteração, Diferente de 0 = passo incremental, Igual a 0 = decremental)
	mov edi, 0
	cmp edx,ebx       
>>>>>>> 1022f932949b01ccc478c90c213546ee7481bd9b

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

<<<<<<< HEAD
	endfor            ; chama a macro 'endfor' declarada na linha 18
	ret               ; retorna ao programa C
=======
	endfor            		; chama a macro 'endfor' declarada na linha 18
	mov eax, edi
	call print_int    		; imprime na tela o total de iteracoes
	mov eax, total_msg  	; imprime na tela a cada iteracao
	call print_string
	ret               		; retorna ao programa C
>>>>>>> 1022f932949b01ccc478c90c213546ee7481bd9b

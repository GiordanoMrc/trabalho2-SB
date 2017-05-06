; file: for.asm
; macro que simula o comando for do C
; FOR
; parametro: (1) valor a ser iterado
; empilha o contexto do switch
; inicia numero do caso presente
; pula para o primeiro caso

; Macro de início da iteração
%macro for 1
	%push for    ; executa o push da macro
	j%-1 %$endloop  ; como argumento eh nz, monta 'jnz endloop'
	%$startloop:  ; inicia corpo do for
%endmacro


; Macro de verificação de fim de interação
%macro endfor 0
	jnz %$startloop  ; verifica se deve continuar iteracoes
	%$endloop:       ; se nao, termina a iteracao
	%pop             ; remove da pilha 
%endmacro

global forSB	 ; declaracao do nome da macro na interface C

section .data

	section .text

	forSB:
	mov eax,[esp+4]   ; captura do argumento 1
	mov ebx,[esp+8]   ; captura do argumento 2 (Numero de iterações desejada)
	mov ecx,[esp+12]  ; captura do argumento 3 (Passo da iteração, Diferente de 0 = passo incremental, Igual a 0 = decremental)

	cmp eax,ebx       

	for nz            ; chama a macro 'for' declarada na linha 10
		cmp ecx,0     ; compara argumento de passo com 0

		jz decr       ; caso for == 0, passo decrementa. Se == 1, segue incrementando

		incr: inc eax ; incrementa eax

		jmp verifica  ; pula para label 'verifica'

		decr: dec eax ; decrementa eax

		verifica:     ; verifica situação da condição de parada
		cmp eax,ebx

	endfor            ; chama a macro 'endfor' declarada na linha 18
	ret               ; retorna ao programa C
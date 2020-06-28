; AddVariables.asm - Chapter 3 example.

.386
.model flat,stdcall
.stack 4096
ExitProcess proto,dwExitCode:dword

; define EQU here

.data		; data section
myWord		WORD	1000h
var1 DWORD 10000h
var2 DWORD 20000h
var3 DWORD ?


.code		; code section
main proc
	inc		myWord		;this is cool, you can inc MEM var.
	mov		bx, myWord
	dec		bx

	; ADD instruction
	mov eax,var1	; EAX = 10000h
	add eax,var2	; EAX = 30000h , add MEM to Reg
	mov var3, eax	; save to var3

	; SUB instruction
	mov eax,var1 ; EAX = 30000h
	sub eax,var2 ; EAX = 20000h

	; NEG instruction (two's complement)
	neg eax
	neg var3		;you can NEG memory, amazing.

	invoke ExitProcess,0
main endp
end main
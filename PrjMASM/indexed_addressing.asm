; indexed_addressing.asm

.386
.model flat,stdcall
.stack 4096
ExitProcess proto,dwExitCode:dword

; define EQU here

.data		; data section
arrayW WORD 1000h,2000h,3000h

.code		; code section
main proc

	;An indexed operand adds a constant to a register to generate an effective 
	;address. Any of the 32-bit general-purpose registers may be used as index 
	;registers.

	;There are different notational forms permitted by MASM (the brackets are part
	;of the notation):

	;		constant[reg]  MASM translate to 	[constant + reg]

	mov esi,OFFSET arrayW
	mov ax,[esi] ; AX = 1000h
	mov ax,[esi+2] ; AX = 2000h
	mov ax,[esi+4] ; AX = 3000h


	invoke ExitProcess,0
main endp
end main
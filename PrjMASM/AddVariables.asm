; AddVariables.asm - Chapter 3 example.

.386
.model flat,stdcall
.stack 4096
ExitProcess proto,dwExitCode:dword

; define EQU here
matrix EQU <10 * 10>
continueMsg TEXTEQU <"Do you wish to continue (Y/N)?">

.data
firstval  dword 20002000h
secondval dword 11111111h
thirdval  dword 22222222h
sum dword 0

byteVal BYTE 10001111b

.code
main proc
	mov	eax,firstval				
	add	eax,secondval		
	add eax,thirdval
	mov sum,eax

	;below are for two useful instructions.
	movzx eax, byteVal	; the movzx if for moving unsigned data
						; from a smaller size (8, 16) to larger size (16, 32)
	movsx eax, byteVal	;  movsx is for moving signed data

	lahf				; copy FLAGS to AH
	sahf				; save AH to FLAGS.

	invoke ExitProcess,0
main endp
end main
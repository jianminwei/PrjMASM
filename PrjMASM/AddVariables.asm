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

.code
main proc
	mov	eax,firstval				
	add	eax,secondval		
	add eax,thirdval
	mov sum,eax

	invoke ExitProcess,0
main endp
end main
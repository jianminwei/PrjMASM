; Jianmin Wei

.386
.model flat,stdcall
.stack 4096
ExitProcess proto,dwExitCode:dword

; define EQU here

.data		; data section

myArrayDW	DWORD 10 dup(0ABh) ; 10 elements array filled with 0ABh


.code		; code section
main proc

	;In real-address mode, CX is the default loop counter for the LOOP 
	;instruction. On the other hand,the LOOPD instruction uses ECX as the loop 
	;counter, and the LOOPW instruction uses CX as the loop counter.

	;;loop 5 times
	mov ax,0
	mov ecx,5
L1:
	inc ax
	loop L1

	invoke ExitProcess,0
main endp
end main
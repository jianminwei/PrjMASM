; Jianmin Wei

.386
.model flat,stdcall
.stack 4096
ExitProcess proto,dwExitCode:dword

; define EQU here

.data		; data section

val1 DWORD 5
result DWORD ?


.code		; code section
main proc
	mov eax,6
	.IF eax > val1
		mov result,1
	.ENDIF

	invoke ExitProcess,0
main endp
end main
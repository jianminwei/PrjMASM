; Jianmin Wei

.386
.model flat,stdcall
.stack 4096
ExitProcess proto,dwExitCode:dword

; define EQU here

.data		; data section


.code		; code section
main proc

	mov ebx, 1

	mov eax, 3
	mov ecx, 4
	cmp eax, ecx
	jg	L1
	mov ebx, 0
	mov eax, 'a'  ;using char as ASCII code
	mov bl, 'b'
	cmp eax, ebx
	je L2

L1:
	add ebx, 1

L2:

	invoke ExitProcess,0
main endp
end main
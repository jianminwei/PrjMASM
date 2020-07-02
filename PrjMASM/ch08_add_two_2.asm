; Jianmin Wei

.386
.model flat,stdcall
.stack 4096
ExitProcess proto,dwExitCode:dword
AddTwo proto, val1:DWORD, val2:DWORD

; define EQU here

.data		; data section

.code		; code section

main proc

	invoke AddTwo, 5, 6	; observe EAX, and ESP

	invoke ExitProcess,0
main endp

;By using PROC parameters, MASM generates all stackframe work.
AddTwo PROC, val1:DWORD, val2:DWORD
	mov eax,val1
	add eax,val2
	ret
AddTwo ENDP

end main
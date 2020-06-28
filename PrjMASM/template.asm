; Jianmin Wei

.386
.model flat,stdcall
.stack 4096
ExitProcess proto,dwExitCode:dword

; define EQU here

.data		; data section


.code		; code section
main proc

	invoke ExitProcess,0
main endp
end main
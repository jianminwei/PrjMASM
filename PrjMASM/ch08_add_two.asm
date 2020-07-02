; Jianmin Wei

.386
.model flat,stdcall
.stack 4096
ExitProcess proto,dwExitCode:dword

; define EQU here

.data		; data section


.code		; code section
main proc
	push 6
	push 5
	call AddTwo ; observe EAX, and ESP


	invoke ExitProcess,0
main endp

;;;;; StackFrame diagram
;	
;	parm2
;	parm1
;	Return Address
;	EBP

y_param EQU [ebp + 12]
x_param EQU [ebp + 8]

AddTwo PROC
	push	ebp				; C++ always push ebp first thing in a function
	mov		ebp, esp		; then set the ebp = esp, ebp is the base pointer for everything.
	mov		eax, y_param	; second parameter
	add		eax, x_param	; first parameter, +8 is because ebp and return address used 8.
	pop		ebp
	ret		8				; ret 8 is equivallent to add esp 8, then return for cleaning up stack.
AddTwo ENDP

end main
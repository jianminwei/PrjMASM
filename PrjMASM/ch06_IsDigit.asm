; Jianmin Wei

.386
.model flat,stdcall
.stack 4096
ExitProcess proto,dwExitCode:dword

; define EQU here

.data		; data section


.code		; code section
main proc
	mov eax, 'a'
	call IsDigit
	jz L1
	mov ebx, 1
L1:

	invoke ExitProcess,0
main endp

;In real-time or high-performance applications, programmers often take advantage 
;of hardware characteristics to fully optimize their code. The IsDigit procedure 
;is an example of this approach because it uses the flag settings of JB, JA, and 
;TEST to return what is essentially a Boolean result.
;This kind of procedure doesn't use memory, and use as much less mov as possible.

;---------------------------------------------------------------------
IsDigit PROC
;
; Determines whether the character in AL is a valid decimal digit.
; Receives: AL = character
; Returns: ZF = 1 if AL contains a valid decimal digit; otherwise, ZF = 0.
;---------------------------------------------------------------------
	cmp al,'0'
	jb NOT_DIGIT ; ZF = 0 when jump taken
	cmp al,'9'
	ja NOT_DIGIT ; ZF = 0 when jump taken
	test ax,0 ; set ZF = 1  ; learn using ZF flag as return.
NOT_DIGIT: ret

IsDigit ENDP

end main
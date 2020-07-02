; Jianmin Wei

.386
.model flat,stdcall
.stack 4096
ExitProcess proto,dwExitCode:dword

; define EQU here

.data		; data section
	string1 BYTE "123456789", 0
	string2 BYTE 10 DUP(?)

	alpha BYTE "ABCDEFGH",0

.code		; code section
main proc

	cld						; clear direction flag
	mov esi,OFFSET string1	; ESI points to source
	mov edi,OFFSET string2	; EDI points to target
	mov ecx,10				; set counter to 10
	rep movsb				; move 10 bytes

	mov edi,OFFSET alpha ; EDI points to the string
	mov al,'F' ; search for the letter F
	mov ecx,LENGTHOF alpha ; set the search count
	cld ; direction = forward
	repne scasb ; repeat while not equal
	jnz quit ; quit if letter not found
	dec edi ; found: back up EDI

quit:

	.data
	Count = 100
	string3 BYTE Count DUP(?)
	
	.code
		mov al,0FFh				; value to be stored
		mov edi,OFFSET string3	; EDI points to target
		mov ecx,Count			; character count
		cld						; direction = forward
		rep stosb				; fill with contents of AL


	invoke ExitProcess,0
main endp
end main
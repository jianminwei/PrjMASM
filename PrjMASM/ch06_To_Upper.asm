; Jianmin Wei

.386
.model flat,stdcall
.stack 4096
ExitProcess proto,dwExitCode:dword

; define EQU here

.data		; data section

myString	BYTE "helloworld", 0
myStringLength = ($ - myString) - 1

.code		; code section
main proc

	;Converting Characters to Upper case
	;The AND instruction provides an easy way to translate a letter from lowercase 
	;to uppercase. If we compare the ASCII codes of capital A and lowercase a, 
	;it becomes clear that only bit 5 is different:
	;
	;		0 1 1 0 0 0 0 1 = 61h ('a')
	;		0 1 0 0 0 0 0 1 = 41h ('A')
	;
	;The rest of the alphabetic characters have the same relationship. If we AND 
	;any character with 11011111 binary, it will convert it to upper case.

mov	ecx, myStringLength
	mov	 esi,0

L1:	movzx eax,myString[esi]	; get character
							; MASMA is amazing, the notation myString[esi] looks like an array.
	and al, 11011111b		; convert to upper

	mov	 myString[esi],al
	inc	 esi
	loop L1

	invoke ExitProcess,0
main endp
end main
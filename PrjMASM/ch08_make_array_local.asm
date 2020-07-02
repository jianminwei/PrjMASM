; (MakeArray.asm)

; This program creates an array on the local variables 
; area of the stack.

INCLUDE Irvine32.inc

.data
count = 100
array WORD count DUP(?)

.code
main PROC

	call	makeArray
	mov	eax,0

	exit

main ENDP

makeArray PROC
	LOCAL myString[30] : BYTE 
	pushad							; save registers

	lea	esi,  myString				; load myString address to esi, LOCAL vars not support OFFSET
	mov	ecx, LENGTHOF myString		; loop counter

L1:	mov	BYTE PTR [esi],'*'			; fill one position
	inc	esi							; move to next
	loop	L1						; continue until ECX = 0

	popad							;restore registers
	ret
makeArray ENDP

END main


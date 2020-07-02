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

;when you code sub-proc, follow the StackFrame convention religiously.
;Test it before and after call, make sure all registers from the 
;calling routine are all same. 
;Then test inside the sub-proc, make sure get all parameters correctly,
;and all local variables allocated correctly.
makeArray PROC
	push	ebp
	mov	ebp,esp
	pushad					; save registers
	lea	esi,[esp-30]		; allocate 30 bytes below current esp, and save it to esi
	mov	ecx,30				; loop counter
L1:	mov	BYTE PTR [esi],'*'	; fill one position
	inc	esi					; move to next
	loop	L1				; continue until ECX = 0

	popad					;restore registers
	pop	ebp
	ret
makeArray ENDP

END main


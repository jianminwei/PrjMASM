; Demonstrate reference parameters   (ArrayFill.asm)

; This program fills an array with 16-bit randomly generated integers.

INCLUDE Irvine32.inc

.data
count = 100
array WORD count DUP(?)

;proto section
ArrayFill proto, p1:PTR DWORD, p2:DWORD		;here you can just give p1,p2, but have to give.

.code
main PROC

	invoke ArrayFill, OFFSET array, count
	
	exit

main ENDP


ArrayFill PROC, arr:PTR DWORD, cnt:DWORD	
	pushad			; save registers, not pushad after last two instructions.
	mov	esi, arr	; offset of array
	mov	ecx, cnt	; array size
	cmp	ecx, 0		; ECX == 0?
	je	L2			; yes: skip over loop
    
L1:
	mov	eax,10000h	; get random 0 - FFFFh
	call	RandomRange	; from the link library
	mov	[esi],ax
	add	esi,TYPE WORD
	loop	L1

L2:	popad			; restore registers
	ret				; clean up the stack
ArrayFill ENDP

END main


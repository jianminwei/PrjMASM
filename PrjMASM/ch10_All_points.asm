; Loop Through Array       (AllPoints.asm)

; Loop through the array of points and set their
; X and Y values.

INCLUDE Irvine32.inc

NumPoints = 3
.data
ALIGN WORD
AllPoints COORD NumPoints DUP(<0,0>)

.code
main PROC
	mov	edi,0				; array index
	mov	ecx,NumPoints			; loop counter
	mov	ax,1					; starting X, Y values

; use address pointer
L1:	mov	(COORD PTR AllPoints[edi]).X,ax
	mov	(COORD PTR AllPoints[edi]).Y,ax
	add	edi,TYPE COORD
	inc	ax
	loop L1

	mov edi, 0
	mov	ecx, NumPoints			; loop counter

	;using index addressing
	;index addressing is more precise.
L2:	mov AllPoints[edi].X, ax
	mov AllPoints[edi].Y, ax
	add	edi,TYPE COORD
	inc	ax
	loop L2

	exit
main ENDP
END main
; Comparing LOCAL with ENTER-LEAVE   (LocalExample.asm)

; This program compares the LOCAL directive to ENTER-LEAVE.

INCLUDE Irvine32.inc

.code
main PROC
	
	call Example1

main ENDP

;using LOCAL, combining the "pushad/popad" is definitely the way to go.
;It keeps the Stackframe clean and the ease of using local variables.
;It's amazing MASM feature.
Example1 PROC
	LOCAL temp:DWORD
	pushad

	mov	eax,temp

	popad
	ret
Example1 ENDP


Example2 PROC
	LOCAL temp:DWORD, SwapFlag:BYTE
	
	mov	eax,temp
	mov	bl,SwapFlag
	
	ret
Example2 ENDP



END main

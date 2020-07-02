; Jianmin Wei

INCLUDE Irvine32.inc

; define EQU here

.data		; data section

array BYTE 1,2,3,4,5,6,7,8

.code
main PROC

	mov esi,OFFSET array	; starting OFFSET
	mov ecx,LENGTHOF array	; size, MASM is amazing, can figure out size of the array.
	mov ebx,TYPE array		; doubleword format
	call DumpMem			; display memory

	exit
main ENDP
END main
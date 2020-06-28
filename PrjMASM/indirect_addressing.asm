; Indirect_addressing.asm
; June 28, 2020
; 
; This program shows how to use "indirect addressing" to access memory element.
; Indirect addressing is best suited for array.


.386
.model flat,stdcall
.stack 4096
ExitProcess proto,dwExitCode:dword

; define EQU here

.data		; data section
byteVal BYTE 10h

arrayB BYTE 10h,20h,30h

.code		; code section
main proc

	;An indirect operand can be any 32-bit general-purpose register (EAX, EBX,
	;ECX, EDX, ESI, EDI, EBP, and ESP) surrounded by brackets. The register is 
	;assumed to contain the address of some data.

	mov esi,OFFSET byteVal
	mov al,[esi] ; AL = 10h

	;Indirect operands are ideal tools for stepping through arrays. In the next example, 
	;arrayB contains 3 bytes. As ESI is incremented, it points to each byte, in order:

	mov esi,OFFSET arrayB
	mov al,[esi] ; AL = 10h
	inc esi
	mov al,[esi] ; AL = 20h
	inc esi
	mov al,[esi] ; AL = 30h

	invoke ExitProcess,0
main endp
end main
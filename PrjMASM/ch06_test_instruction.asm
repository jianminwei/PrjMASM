; Jianmin Wei

.386
.model flat,stdcall
.stack 4096
ExitProcess proto,dwExitCode:dword

; define EQU here

.data		; data section


.code		; code section
main proc

	;The TEST instruction performs an implied AND operation between each 
	;pair of matching bits in two operands and sets the Sign, Zero, and 
	;Parity flags based on the value assigned to the destination
	;operand. The only difference between TEST and AND is that TEST does 
	;not modify the destination operand.

	;Similarly, The CMP (compare) instruction performs an implied subtraction
	;of a source operand from a destination operand. Neither operand is modified:

	;		CMP destination,source

	;When two unsigned operands are compared, the Zero and Carry flags indicate
	;the following relations between operands:

	;		CMP Results				ZF		CF
	;	Destination < source		0		1
	;	Destination > source		0		0
	;	Destination = source		1		0

	;When two signed operands are compared, the Sign, Zero, and Overflow flags 
	;indicate the following relations between operands

	;		CMP Results Flags
	;	Destination < source		SF ≠ OF
	;	Destination > source		SF = OF
	;	Destination = source		ZF = 1

	invoke ExitProcess,0

main endp
end main
; Jianmin Wei, June 28, 2020
; flags.asm
; this program shows how the FLAG behaves with each arithmetic instruction.

.386
.model flat,stdcall
.stack 4096
ExitProcess proto,dwExitCode:dword

; define EQU here

.data		; data section


.code		; code section
main proc

	; test out ZF flag
	mov ecx,1	; MOV	doesn't affect ZF 
	sub ecx,1 ; ECX = 0, ZF = 1
	inc ecx		; ZF = 0
	dec	ecx		; ZF = 1

	mov eax,0FFFFFFFFh
	inc eax ; EAX = 0, ZF = 1
	inc eax ; EAX = 1, ZF = 0
	dec eax ; EAX = 0, ZF = 1

	; test out Carry flag
	;When adding two unsigned integers, the Carry flag is a copy 
	;of the carry out of the most significant bit of the destination 
	;operand. Intuitively, we can say CF 1 when the sum exceeds 
	;the storage size of its destination operand

	mov al,0FFh
	add al,1 ; AL = 00, CF = 1  ; when you ADD AL(FF), 1, cpu doesn't put 
	                            ; 1 to the AH, register. In stead, it set
								; CY flag. Very interesting, and need to remember.
								; The instruction does exactly what it supposed to do.

	;On the other hand, if 1 is added to 00FFh in AX, the sum easily 
	;fits into 16 bits and the Carry flag is clear:
	mov ax,00FFh
	add ax,1	; AX = 0100h, CF = 0

	;But adding 1 to FFFFh in the AX register generates a Carry 
	;out of the high bit position of AX:
	mov ax,0FFFFh
	add ax,1	; AX = 0000, CF = 1

	;Subtraction and the Carry Flag A subtract operation sets the 
	;Carry flag when a larger unsigned integer is subtracted 
	;from a smaller one.
	mov al,1
	sub al,2	; AL = FFh, CF = 1

	;Sign Flag The Sign flag is set when the result of a signed arithmetic 
	;operation is negative. The next example subtracts a larger integer (5) 
	;from a smaller one (4):
	;From a mechanical point of view, the Sign flag is a copy of the destination 
	;operand’s high bit.

	mov bl,1 ; BL = 01h
	sub bl,2 ; BL = FFh (-1), SF = 1

	;Overflow Flag The Overflow flag is set when the result of a signed arithmetic 
	;operation overflows or underflows the destination operand. For example, the largest 
	;possible integer signed byte value is 127; adding 1 to it causes overflow:

	mov al,+127
	add al,1 ; OF = 1

	;Similarly, the smallest possible negative integer byte value is 128. 
	;Subtracting 1 from it causes underflow. The destination operand value does not 
	;hold a valid arithmetic result, and the Overflow flag is set:

	mov al,-128
	sub al,1 ; OF = 1

	;The Addition Test There is a very easy way to tell whether signed overflow has occurred
	;when adding two operands. Overflow occurs when:
	;• Adding two positive operands generates a negative sum
	;• Adding two negative operands generates a positive sum
	;Overflow never occurs when the signs of two addition operands are different.


	;NEG Instruction The NEG instruction produces an invalid result if the 
	;destination operand cannot be stored correctly. For example, if we move 
	;128 to AL and try to negate it, the correct value (128) will not fit into AL. 
	;The Overflow flag is set, indicating that AL contains an invalid value:

	mov al,-128 ; AL = 10000000b
	neg al		; AL = 10000000b, OF = 1


	invoke ExitProcess,0
main endp
end main
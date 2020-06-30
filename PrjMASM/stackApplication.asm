; Jianmin Wei

.386
.model flat,stdcall
.stack 4096
ExitProcess proto,dwExitCode:dword

; define EQU here

.data		; data section


.code		; code section
main proc

	;Stack Applications
	;There are several important uses of runtime stacks in programs:
	; • A stack makes a convenient temporary save area for registers when 
	; they are used for more than one purpose. After they are modified, 
	; they can be restored to their original values.
	; • When the CALL instruction executes, the CPU saves the current 
	; subroutine’s return address on the stack.
	; • When calling a subroutine, you pass input values called arguments 
	;   by pushing them on the stack.
	; • The stack provides temporary storage for local variables inside 
	;   subroutines.

	; PUSH Instruction
    ; The PUSH instruction first decrements ESP and then copies a source operand into the stack.
	; A 16-bit operand causes ESP to be decremented by 2. A 32-bit operand causes ESP to be decremented
	; by 4. There are three instruction formats:
	;
	;		PUSH reg/mem16
	;		PUSH reg/mem32
	;		PUSH imm32

	; POP Instruction
	; The POP instruction first copies the contents of the stack element pointed to by ESP into a 16- or
	; 32-bit destination operand and then increments ESP. If the operand is 16 bits, ESP is incremented
	; by 2; if the operand is 32 bits, ESP is incremented by 4:
	;
	;		POP reg/mem16
	;		POP reg/mem32

	; PUSHFD and POPFD Instructions
	; The PUSHFD instruction pushes the 32-bit EFLAGS register on the stack, and POPFD pops the
	; stack into EFLAGS:

	;		pushfd
	;		popfd

	; A less error-prone way to save and restore the flags is to push them on the stack and immediately
	; pop them into a variable:

.data				; you can have many .data section, MASM will merge them.
saveFlags DWORD ?

.code				; similarly, you can have many .code sections.

	pushfd ; push flags on stack
	pop saveFlags ; copy into a variable

	;The following statements restore the flags from the same variable:

	push saveFlags ; push saved flag values
	popfd ; copy into the flags

	; PUSHAD, PUSHA, POPAD, and POPA
	;The PUSHAD instruction pushes all of the 32-bit general-purpose registers 
	;on the stack in the following order: EAX, ECX, EDX, EBX, ESP 
	; (value before executing PUSHAD), EBP, ESI, and EDI. The
	; POPAD instruction pops the same registers off the stack in reverse order. 
	; Similarly, the PUSHA instruction, pushes the 16-bit general-purpose registers 
	; (AX, CX, DX, BX, SP, BP, SI, DI) on the stack in the order listed. The POPA 
	; instruction pops the same registers in reverse. You should only use PUSHA and
	; POPA when programming in 16-bit mode.

	; If you write a procedure that modifies a number of 32-bit registers, use PUSHAD at the
	; beginning of the procedure and POPAD at the end to save and restore the registers.

	invoke ExitProcess,0
main endp
end main
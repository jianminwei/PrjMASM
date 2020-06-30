; Jianmin Wei

.386
.model flat,stdcall
.stack 4096
ExitProcess proto,dwExitCode:dword

; define EQU here

.data		; data section
varDW	DWORD	0Fh;


.code		; code section
main proc

	;;;;;;;;;;AND instruction addressing
	;	AND reg,reg
	;	AND reg,mem
	;	AND reg,imm
	;	AND mem,reg
	;	AND mem,imm		;Amazing, Intel provide imm to mem addressing!!

	;AND reg reg
	and eax, 0h		; clear eax
	add eax, 01h	; mov instructions doesn't chage the flag, this will change ZR=0
	mov eax, 01h	;
	mov ebx, 010h	;
	and eax, ebx	; eax has 0, ZR =1

	;AND reg, mem
	mov eax, 1000b	;
	and eax, varDW	; ZR = 0

	;AND reg, imm
	mov eax, 11b	
	and eax, 100b	; ZR = 1

	;AND mem, reg
	mov eax, 10b
	and varDW, eax	; varDW = 10b

	;AND mem, imm
	and varDW, 1b	; varDW = 10b AND 1b = 0, ZR = 1


	invoke ExitProcess,0
main endp
end main
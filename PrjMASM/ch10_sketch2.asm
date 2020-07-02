; Jianmin Wei

.386
.model flat,stdcall
.stack 4096
ExitProcess proto,dwExitCode:dword

; define EQU here

; STRUCT is user defined TYPE. You should
; define the TYPEs before .data section
Employee STRUCT
	IdNum BYTE "000000000"			; 9
	LastName BYTE 30 DUP(0)			; 30
	ALIGN WORD						; 1 byte added
	Years WORD 0					; 2
	ALIGN DWORD						; 2 bytes added
	SalaryHistory DWORD 0,0,0,0		; 16
Employee ENDS						; 60 total

.data		; data section
department Employee 5 DUP(<>)

.code		; code section
main proc

	;using index addressing.
	;mov esi, Employee  ; 
	;mov department[1 * SIZEOF Employee].Years, 4
	mov department[0].Years, 4  ; "department" is the address of department
								; so department[0] is the first element of department.

	mov department[2 * SIZEOF Employee].Years, 4  ; 2 * SIZEOF Employee is the 3rd element.
	mov ax, department[2 * SIZEOF Employee].Years

	invoke ExitProcess,0
main endp
end main
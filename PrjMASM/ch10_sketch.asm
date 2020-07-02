; Jianmin Wei

.386
.model flat,stdcall
.stack 4096
ExitProcess proto,dwExitCode:dword

; define EQU here

; STRUCT is user defined TYPE. You should
; define the TYPEs before .data section
COORD STRUCT
	X WORD ? ; offset 00
	Y WORD ? ; offset 02
COORD ENDS

Employee STRUCT
	IdNum BYTE "000000000"			; 9
	LastName BYTE 30 DUP(0)			; 30
	ALIGN WORD						; 1 byte added
	Years WORD 0					; 2
	ALIGN DWORD						; 2 bytes added
	SalaryHistory DWORD 0,0,0,0		; 16
Employee ENDS						; 60 total

.data		; data section
	myByte		BYTE	'a', 'b'		;define BYTE type with 2 elements.
	myByte2		BYTE	1, 2, 3			;define BYTE type with 3 elements.
	myWord		WORD	1				; a single WORD
	myWord2		WORD	2, 3			; 2  WORDs
	myDWord		DWORD	10				; a DWORD

	point1 COORD <5,10>					; X = 5, Y = 10
	point2 COORD <20>					; X = 20, Y = ?
	point3 COORD <>						; X = ?, Y = ?
	worker Employee <>					; (default initializers)

	person1 Employee <"555223333">		;IdNum = "555223333", remaining fields defaults.

	person2 Employee {"123456789"}		;you can also use {}, this is better, same as C++
	person3 Employee {,"dJones"}		;skip IdNum, initialize lastname

	;;;Array of Structures
	NumPoints = 3
	AllPoints COORD NumPoints DUP(<0,0>)

	myEmployees Employee 100 DUP({})	; 100 elements Employee array

.code		; code section
main proc
	mov esi, OFFSET myEmployees		; starting address of myEmployees
	mov eax, TYPE myEmployees		; 60, size of Emploee structure
	mov ebx, SIZEOF myEmployees		; 6000, size of the myEmployees array
	mov ecx, LENGTHOF myEmployees	; 100, LENGTHOF myEmployees array

	;You can referenceing individual STRUCT element attributes.
	;TYPE Employee.SalaryHistory		; 4
	;LENGTHOF Employee.SalaryHistory	; 4
	;SIZEOF Employee.SalaryHistory		; 16
	;TYPE Employee.Years				; 2

	;Indirect and Indexed Operands
	;Indirect operands permit the use of a register (such as ESI) to address 
	;structure members.

	mov esi,OFFSET worker
	mov ax,(Employee PTR [esi]).Years	;this is powerfule!
										;When using PTR, you need to specify a type, like
										;Employee, QWORD, DWORD, WORD, BYTE etc. So the 
										;PTR knows the boundry.

	.data
	department Employee 5 DUP(<>)

	.code
	;mov esi, Employee  ; 
	mov department[1 * SIZEOF Employee].Years, 4


	invoke ExitProcess,0
main endp
end main
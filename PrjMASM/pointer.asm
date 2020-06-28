; Jianmin Wei

.386
.model flat,stdcall
.stack 4096
ExitProcess proto,dwExitCode:dword

; define EQU here

.data		; data section

;A variable containing the address of another variable is called a pointer. 
;Pointers are a great tool for manipulating arrays and data structures 
;because the address they hold can be modified at runtime.

arrayB byte 10h,20h,30h,40h
ptrB dword arrayB			;pointer pointing to arrayB

;The TYPEDEF operator lets you create a user-defined type that has all the 
;status of a built-in type when defining variables. TYPEDEF is ideal for 
;creating pointer variables.

PBYTE TYPEDEF PTR BYTE

ptr1 PBYTE ? ; uninitialized
ptr2 PBYTE arrayB ; points to an array

.code		; code section
main proc



	invoke ExitProcess,0
main endp
end main
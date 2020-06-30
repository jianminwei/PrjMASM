;Jianmin Wei

;;;; How to setup irvine library
;
;    1. Select Project, Prjject properties from Visual Studio menu
;    2. Expand configure properties, and select "VC++ Directories"
;          a. For the "Include Directories", add "C:\irvine", click Apply.
;          b. For the "Library Directories", add "C:\irvine", click Apply.
;    3. Expand "Linker" 
;		   a. Under "Input", add "Irvine32.lib;" to the first library
;              list, click Apply.
;

.386
.model flat,stdcall
.stack 4096
ExitProcess proto,dwExitCode:dword

; define EQU here

.data		; data section


.code		; code section
main proc

	invoke ExitProcess,0
main endp
end main


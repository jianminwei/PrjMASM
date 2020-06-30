; Library Test #1: Integer I/O   (InputLoop.asm)

; Tests the Clrscr, Crlf, DumpMem, ReadInt, SetTextColor, 
; WaitMsg, WriteBin, WriteHex, and WriteString procedures.


;;;; Jianmin, setup irvine library
;    1. Select Project, Prjject properties from Visual Studio menu
;    2. Expand configure properties, and select "VC++ Directories"
;          a. For the "Include Directories", add "C:\irvine", click Apply.
;          b. For the "Library Directories", add "C:\irvine", click Apply.
;    3. Expand "Linker" 
;		   a. Under "Input", add "Irvine32.lib;" to the first library
;              list, click Apply.
;

INCLUDE Irvine32.inc

.data
COUNT = 4
BlueTextOnGray1 = blue + (lightGray * 16)		;you can change your color here.
;BlueTextOnGray = yellow  + (lightGray * 16)

DefaultColor2 = lightGray + (black * 16)

arrayD SDWORD 12345678h,1A4B2000h,3434h,7AB9h

prompt BYTE "Enter a 32-bit signed integer: ",0

.code
main PROC

; Set text color to blue text on a light gray background

     mov   eax,BlueTextOnGray1
	call  SetTextColor		;SetTextColoar takes the color Byte from eax
	call  Clrscr			; clear the screen
	
	; Display an array using DumpMem.
	
	mov	esi,OFFSET arrayD	; starting OFFSET
	mov	ebx,TYPE arrayD	; doubleword = 4 bytes
	mov	ecx,LENGTHOF arrayD	; number of units in arrayD
	call	DumpMem			; display memory

     ; Ask the user to input a sequence of signed integers	
     
	call	 Crlf			; new line
     mov   ecx,COUNT
    
L1:  mov   edx,OFFSET prompt  
     call  WriteString		;takes the string from edx
     call  ReadInt			; input integer into EAX
     call  Crlf			; new line

; Display the integer in decimal, hexadecimal, and binary

	call	 WriteInt			; display in signed decimal
	call	 Crlf
	call	 WriteHex			; display in hexadecimal
	call	 Crlf
	call	 WriteBin			; display in binary
	call	 Crlf
	call	 Crlf
     Loop  L1                 ; repeat the loop

; Return console window to default colors.
	call	 WaitMsg			; "Press any key..."
	mov	 eax,DefaultColor2
	call	 SetTextColor
	call	 Clrscr
	
	exit
main ENDP
END main
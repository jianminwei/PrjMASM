; Jianmin Wei

INCLUDE Irvine32.inc


SYSTEMTIME STRUCT
	wYear WORD ?
	wMonth WORD ?
	wDayOfWeek WORD ?
	wDay WORD ?
	wHour WORD ?
	wMinute WORD ?
	wSecond WORD ?
	wMilliseconds WORD ?
SYSTEMTIME ENDS

.data		; data section
	sysTime	SYSTEMTIME {}
.code


main PROC
	; Here is the syntax if calling from C++
    ; void GetLocalTime(
	;			LPSYSTEMTIME lpSystemTime
	;		);
	;
	; typedef struct _SYSTEMTIME {
	;		WORD wYear;
	;		WORD wMonth;
	;		WORD wDayOfWeek;
	;		WORD wDay;
	;		WORD wHour;
	;		WORD wMinute;
	;		WORD wSecond;
	;		WORD wMilliseconds;
	;	} SYSTEMTIME, *PSYSTEMTIME, *LPSYSTEMTIME;

	; From above C++ syntax, it's identical calling from assembly	
	INVOKE GetLocalTime, ADDR sysTime ;ADDR, OFFSET are the same. ADDR seems more clear.
	movzx eax,sysTime.wYear
	call WriteDec
	call crlf

	exit
main ENDP
END main
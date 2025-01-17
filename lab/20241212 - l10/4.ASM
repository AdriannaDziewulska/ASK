MOV CL, C0
JMP Start
DB 08
DB 1F
DB 2D

	IN 00
	CMP AL, 0D
	JZ Enter
	CMP AL, 08
	JZ Backspace
	MOV [CL], AL
	INC CL
	CMP CL, FF
	JZ Endl
	IRET
;
	DEC CL
	MOV BL, [CL]
	CMP BL, 21
	JS Backspace
	MOV [CL], DL 
	IRET
;
	CMP CL, D0
	JS Add1
	CMP CL, E0
	JS Add2
	CMP CL, F0
	JS Add3


Backspace: 	INT 06
	JMP Start
Enter:		INT 07
	JMP Start
Add1:
	MOV CL, D0
	IRET

Add2:
	MOV CL, E0
	IRET

Add3:
	MOV CL, F0
	IRET
Start:
	INT 05
	JMP Start

Endl:
	END
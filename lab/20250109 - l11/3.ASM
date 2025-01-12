MOV CL, C0
JMP Start
DB 6

MOV [CL], AL
INC CL
IRET

Start:
	OUT 07
	OUT 08 

	MOV AL, 00
	IN 07
	CMP Al, 00
	JZ Num
	CMP AL, 0D
	JZ Enter
	CMP AL, 08
	JZ Backspace
	INT 05
	CMP CL, FF
	JZ Endl
	
	Num:
	MOV AL, 00
	IN 08
	CMP AL, 00
	JZ Start
	CMP AL, 0D
	JZ Enter
	CMP AL, 08
	JZ Backspace
	INT 05
	CMP CL, FF
	JZ Endl
	JMP Start
	

Backspace:
	DEC CL
	MOV BL, [CL]
	CMP BL, 21
	JS Backspace
	MOV [CL], DL
	JMP Start


Enter:
	CMP CL, D0
	JS Add1
	CMP CL, E0
	JS Add2
	CMP CL, F0
	JS Add3

Add1:
	MOV CL, D0
	JMP Start

Add2:
	MOV CL, E0
	JMP Start

Add3:
	MOV CL, F0
	JMP Start


Endl:
	END
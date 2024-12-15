MOV CL, C0
JMP Start
DB 6



Start:
	IN 00
	CMP AL, 0D
	JZ Enter
	CMP AL, 08
	JZ Backspace
	MOV [CL], AL
	INC CL
	CMP CL, FF
	JZ Endl
	INT 05

Backspace:
	DEC CL
	MOV BL, [CL]
	CMP BL, 21
	JS Backspace
	MOV [CL], DL
	INT 05


Enter:
	CMP CL, D0
	JS Add1
	CMP CL, E0
	JS Add2
	CMP CL, F0
	JS Add3
	INT 05

Add1:
	MOV CL, D0
	INT 05
Add2:
	MOV CL, E0
	INT 05
Add3:
	MOV CL, F0
	INT 05

Endl:
	END
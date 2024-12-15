JMP Main
JMP Wrap
DB 0E

Main:
	MOV DL, C0
	MOV BL, 70

Wrap:
	MOV CL, 70

Rep:
	IN 00
	MOV [CL], AL
	CMP AL, 0D
	JZ Cout
	INC CL
	CMP CL, 96
	JZ Wrap
	INT 04

Cout:
	MOV CL, 70
	Cout2:
	MOV AL, [CL]
	MOV [DL], AL
	INC CL
	CMP CL, 96
	JZ Main
	INC DL
	JMP Cout2

Endl:
	END

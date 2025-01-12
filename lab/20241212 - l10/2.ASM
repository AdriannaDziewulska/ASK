JMP Start
DB 00
DB 04

	CMP CL, 21
	JZ MinusTwo
	CMP CL, 41
	JZ MinusTwo
	CMP CL, A
	JNS MinusOne
	JMP For

MinusOne:
	MOV BL, 0
	SUB BL, 1
	MOV CL, [BL]
	MOV AL, 90
	OUT 01 
	IRET

MinusTwo:
	MOV CL, 0
	SUB CL, 2
	MOV AL, 90
	OUT 01
	IRET

For:
	MOV AL, 24
	OUT 01
	DEC CL
	MOV AL, 0
	OUT 01
	CMP CL, 0
	JNZ For
	IRET

Start:
	MOV DL, A0
	IN 00
	SUB AL, 30
	MOV [DL], AL
	MOV CL, [DL]
	INT 03
	MOV BL, 0
	SUB BL, 2
	CMP CL, BL
	JZ Endl
	JMP Start	

Endl:
	END
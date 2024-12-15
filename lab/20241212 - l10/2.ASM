JMP Start
DB 04
DB 21

Start:
	MOV DL, A0
	IN 00
	SUB AL, 30
	MOV [DL], AL
	MOV CL, [DL]
	CMP CL, 21
	JZ MinusTwo
	CMP CL, 41
	JZ MinusTwo
	CMP CL, A
	JNS MinusOne
	For:
		MOV AL, 24
		OUT 01
		DEC CL
		MOV AL, 0
		OUT 01
		CMP CL, 0
		JZ Start
		INT 03

MinusOne:
	MOV BL, 0
	SUB BL, 1
	MOV CL, [BL]
	MOV AL, 90
	OUT 01 
	INT 02

MinusTwo:
	MOV CL, 0
	SUB CL, 2
	MOV AL, 90
	OUT 01
	END

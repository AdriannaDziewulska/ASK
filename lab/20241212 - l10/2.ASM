JMP Start
DB 00
DB 07
DB 23
DB 32
DB 3E

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
	JMP for
;
	MOV BL, 0
	SUB BL, 1
	MOV CL, [BL]
	MOV AL, 90
	OUT 01 
	IRET
;
	MOV CL, 0
	SUB CL, 2
	MOV AL, 90
	OUT 01
	IRET
;
	MOV AL, 24
	OUT 01
	DEC CL
	MOV AL, 0
	OUT 01
	CMP CL, 0
	JNZ For
	IRET
;
MinusOne:	INT 04
JMP Start
MinusTwo:	INT 05
JMP Endl
For:		INT 06

Start:
	MOV DL, A0
	INT 03
	MOV BL, 0
	SUB BL, 2
	CMP CL, BL
	JZ Endl
	JMP Start
	

Endl:
	END
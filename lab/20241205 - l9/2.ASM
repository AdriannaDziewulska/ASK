Main:
	MOV DL,C0
	MOV BL,70

Wrap:
	MOV CL,70
Rep:
	IN 00
	MOV [CL],AL
	CMP AL,0D
	JZ Cout
	INC CL
	CMP CL,B0
	JZ Wrap
	JMP Rep

Cout:
	MOV CL, 70
	Cout2:
	MOV AL,[CL]
	MOV [DL],AL
	INC CL
	CMP CL,B0
	JZ Endl
	INC DL
	JMP Cout2

Endl:
	END

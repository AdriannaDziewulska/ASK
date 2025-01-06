OUT 01
MOV BL, 80
Start:
	IN 00
	MOV [BL], AL
	INC BL
	CMP AL, 2E
	JZ Cout
	CMP AL, 20
	JZ Inc
	CMP BL, B0
	JZ Error
	JMP Start

Inc: 
	INC DL
	JMP Start



Cout:
	CMP DL, 0
	JZ Error
	DEC BL
	MOV DL, 0
	MOV CL, C0
	CoutIn:
		MOV AL, [BL]
		PUSH AL
		INC DL
		DEC BL
		CMP BL, 7E
		JZ CoutPopE
		CMP AL, 20
		JZ CoutPop
		CMP AL, 00
		JZ CoutPopE
		JMP CoutIn
		CoutPop:
			POP AL
			MOV [CL], AL
			INC CL
			DEC DL
			CMP DL, 0
			JZ CoutIn
			JMP CoutPop
		CoutPopE:
			POP AL
			MOV [CL], AL
			INC CL
			DEC DL
			CMP DL, 0
			JZ Done
			JMP CoutPop

Error:
	MOV AL, 90
	OUT 01
	JMP Endl

Done:
	MOV AL, 24
	OUT 01
	JMP Endl

Endl:
	END

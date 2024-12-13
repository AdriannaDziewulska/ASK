Rep:
	IN 00
	CMP AL,0D
	JZ Number
	SUB AL,30
	ADD BL, AL
	JMP Rep

Number:
	CMP BL, A
	JS One
	CMP BL, 64
	JS Two
	JMP Three
	
One:
	ADD BL, 30
	MOV [D0],BL
	JMP Endl

Two:	
	MOV [CL], BL
	MOV AL, [CL]
	MOD AL, A
	ADD AL, 30
	MOV [D1], AL
	DIV BL, A
	MOD BL, A
	ADD BL, 30
	MOV [D0], BL
	JMP Endl


Three:
	MOV [CL], BL
	MOV AL, [CL]
	MOD AL, A
	ADD AL, 30
	MOV [D2], AL
	DIV BL, A
	MOD BL, A
	ADD BL, 30
	MOV [D1], BL
	MOV AL, 31
	MOV [D0], AL
	JMP Endl

Endl:
	END
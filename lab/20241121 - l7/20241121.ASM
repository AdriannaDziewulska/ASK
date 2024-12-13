JMP start

DB "Hello"
DB 0

start:
MOV AL, 02
CALL 40

ORG 40
	MOV CL, C0
	PUSH AL
	POP BL
	Rep: 
		MOV DL, [AL]
		CMP DL, 0
		JZ REP2
		PUSH DL
		INC AL
		JMP Rep
	REP2: 
		MOV DL, [BL]
		CMP DL, 0		
		JZ koniec
		POP DL
		MOV [CL], DL
		INC BL
		INC CL
		JMP REP2
koniec:
RET

END
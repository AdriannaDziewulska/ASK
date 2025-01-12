; Program steruj¹cy silnikiem krokowym
Start:
	MOV AL, 1
loop:
	OUT 05
	CALL 10
	ROL AL
	CMP AL, 10
	JZ Start
	JMP loop
ORG 10
	NOP
	RET 
END
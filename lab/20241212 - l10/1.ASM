MOV AL, 8
MOV BL, 0
CMP BL, 0
JZ Call
CALL 30

DB 37

ORG 30
	DIV AL, BL
	JMP Endl

Call:
	INT 0D


MOV AL, 90
OUT 01
ADD AL, 90
PUSHF

Endl:
	END

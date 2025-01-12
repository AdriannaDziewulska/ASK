MOV AL, 3
MOV BL, 3
MOV CL, 0

Start:
	AND BL, 1
	CMP BL, 0
	JZ Next
	ADD CL, AL
Next:
	SHL AL
	SHR BL		
	CMP BL, 0
	JNZ Start
END
Start:
	MOV DL, D0

Rep:		
	IN 00 
	CMP DL, FF
	JZ Start
	MOV [DL], AL
	INC DL	
	CMP AL,0D 		; Czy to byl klawisz Enter? (ASCII 0D)
	JNZ Rep 		; Nie - skocz do poczatku. Tak - zakoncz.

END
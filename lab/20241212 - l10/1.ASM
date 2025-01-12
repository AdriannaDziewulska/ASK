
MOV AL, 8        
MOV BL, 0  
      
CMP BL, 0        
JZ Call          
JNZ DIVV

DB 0E
	PUSH AL      
	PUSH BL      
	MOV AL, 90   
	OUT 01       
	POP BL       
	MOV BL, 8     
	PUSH BL      
	POPF         
	POP AL       
	IRET         

Call:
	INT 0D       
	JMP Endl

DIVV:
	DIV AL, BL           
	JMP Endl         

Endl:
	END

JMP Start 
DB 50

Start:
	MOV BL, 52
	STI
Rep:
	IN 03     
	CMP AL, 0    		
	JZ HeatOn     
	JMP HeatOff   

HeatOn:
	MOV AL, 80    
	OUT 03        
	JMP Rep     

HeatOff:
	MOV AL, 0     
	OUT 03      
	JMP Rep 

ORG 50
	JMP PastData
	DB CF
	DB FF
	DB CB
	DB FD
	DB DD
	DB 4F
	DB 9F
	DB B7	
	DB B
	DB FB
	PastData:
		CMP BL, 5C
		JZ Reset
		MOV AL,[BL] 
		OUT 02
		INC BL
		JMP Stop

	Reset:
		MOV BL,52
		JMP PastData

	Stop:
		IRET

END

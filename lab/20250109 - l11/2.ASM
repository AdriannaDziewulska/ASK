JMP Start         
DB 06             
DB 20             
DB 00             

org 6
nop
iret

ORG 20            
CLI                
PUSH AL            
PUSHF              
IN 07              
NOP                

CMP AL, 77         
JZ Up
CMP AL, 61         
JZ Left
CMP AL, 73         
JZ Down
CMP AL, 64         
JZ Right
CMP AL, 20         
JZ Endl

              
JMP Done               

Up:
MOV AL, 8F         
OUT 04
JMP Done

Left:
MOV AL, 2F         
OUT 04
JMP Done

Down:
MOV AL, 4F         
OUT 04
JMP Done

Right:
MOV AL, 1F         
OUT 04
JMP Done

Endl:
MOV AL, 0          
OUT 04

Done:
POPF               
POP AL             
STI  
IRET               

Start:

STI                
OUT 07             
 OUT 04          

Idle:
NOP                
JMP Idle           

END

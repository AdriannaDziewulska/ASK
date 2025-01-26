JMP Start
DB 00
DB 00
DB 05

    IN 00
    MOV [CL], AL
    CMP AL, 0D
    JZ Enter
    INC CL
    CMP CL, 98
    JZ Wrap
    IRET

Start:
    MOV DL, C0
    MOV CL, 70
Start2:
    INT 04
    JMP Start2

Wrap:
    MOV CL, 70
    JMP Start2

Enter:
    MOV CL, 70
    MOV DL, C0
Cout2:
    MOV AL, [CL]
    MOV [DL], AL
    CMP AL, 00
    JZ Start
    MOV AL, 0
    MOV [CL], AL
    INC CL
    CMP CL, 98
    JZ Start
    INC DL
    JMP Cout2

Endl:
    END

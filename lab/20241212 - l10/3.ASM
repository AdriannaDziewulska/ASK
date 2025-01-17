JMP Start
DB 00                ; Zmienna pomocnicza
DB 00                ; Zmienna pomocnicza
DB 05                ; Rozmiar bufora (5 bajtów)

    IN 00
    MOV [CL], AL      ; Zapisz znak do bufora
    CMP AL, 0D        ; SprawdŸ, czy to Enter
    JZ Enter          ; Jeœli Enter, przejdŸ do obs³ugi
    INC CL            ; Zwiêksz wskaŸnik zapisu
    CMP CL, 98        ; SprawdŸ, czy nie osi¹gniêto koñca bufora
    JZ Wrap           ; Jeœli tak, przejdŸ do obrotu bufora
    IRET

Start:
    MOV DL, C0        ; Ustaw port wyjœciowy dla VDU
    MOV CL, 70        ; WskaŸnik zapisu (start od 70h)
Start2:
    INT 04            ; Wywo³anie przerwania 04 (odczyt z klawiatury)
    JMP Start2        ; Nieskoñczona pêtla

Wrap:
    MOV CL, 70        ; Zresetuj wskaŸnik zapisu, jeœli bufor jest pe³ny
    JMP Start2        ; Powróæ do przerwania 04

Enter:
    MOV CL, 70        ; Ustaw wskaŸnik zapisu na pocz¹tek bufora
    MOV DL, C0        ; Ustaw port wyjœciowy dla VDU
Cout2:
    MOV AL, [CL]      ; Za³aduj znak z bufora
    MOV [DL], AL      ; Wyœlij znak do VDU
    CMP AL, 00
    JZ Start
    MOV AL, 0         ; Wyzeruj zapisany znak w buforze
    MOV [CL], AL      ; Zresetuj bufor
    INC CL            ; Przesuñ wskaŸnik zapisu
    CMP CL, 98        ; SprawdŸ, czy dotarliœmy do koñca bufora
    JZ Start          ; Jeœli tak, rozpocznij od nowa
    INC DL            ; Przesuñ wskaŸnik wyœwietlania na VDU
    JMP Cout2         ; Kontynuuj wyœwietlanie znaków z bufora

Endl:
    END

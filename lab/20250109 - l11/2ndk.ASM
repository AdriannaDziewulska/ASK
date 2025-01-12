
JMP Start         ; Skok za tablicê wektorów przerwañ
DB 00             ; Wektor przerwania zegara
DB 10             ; Wektor przerwania klawiatury (zmieniony na 07)
DB 00             ; Wektor przerwania klawiatury numerycznej

ORG 20            ; Pocz¹tek procedury obs³ugi przerwania klawiatury

IN 07              ; Odczytaj kod naciœniêtego klawisza z porto wyœwietlacza)

; Obs³uga naciœniêtych klawiszy
CMP AL, 77         ; Czy naciœniêto 'w' (w górê)?
JZ Up
CMP AL, 61         ; Czy naciœniêto 'a' (w lewo)?
JZ Left
CMP AL, 73         ; Czy naciœniêto 's' (w dó³)?
JZ Down
CMP AL, 64         ; Czy naciœniêto 'd' (w prawo)?
JZ Right
CMP AL, 20         ; Czy naciœniêto 'spacja' (Enter)?
JZ Endl

RET                ; Zakoñczenie procedury obs³ugi przerwania

Up:
MOV AL, 8F         ; Ruch w górê
OUT 04
JMP Done

Left:
MOV AL, 2F         ; Ruch w lewo
OUT 04
JMP Done

Down:
MOV AL, 4F         ; Ruch w dó³
OUT 04
JMP Done

Right:
MOV AL, 1F         ; Ruch w prawo
OUT 04
JMP Done

Endl:
MOV AL, 0          ; Przejœcie do nowej linii (resetowanie)
OUT 04

Done:
IRET               ; Powrót z procedury obs³ugi przerwania

Start:
STI
OUT 07             ; Wysy³anie danych na port 07 (inicjalizacja klawiatury)
CALL 20            ; Wywo³anie procedury obs³ugi przerwania klawiatury
JMP Start

END
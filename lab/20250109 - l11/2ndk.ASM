
JMP Start         ; Skok za tablic� wektor�w przerwa�
DB 00             ; Wektor przerwania zegara
DB 10             ; Wektor przerwania klawiatury (zmieniony na 07)
DB 00             ; Wektor przerwania klawiatury numerycznej

ORG 20            ; Pocz�tek procedury obs�ugi przerwania klawiatury

IN 07              ; Odczytaj kod naci�ni�tego klawisza z porto wy�wietlacza)

; Obs�uga naci�ni�tych klawiszy
CMP AL, 77         ; Czy naci�ni�to 'w' (w g�r�)?
JZ Up
CMP AL, 61         ; Czy naci�ni�to 'a' (w lewo)?
JZ Left
CMP AL, 73         ; Czy naci�ni�to 's' (w d�)?
JZ Down
CMP AL, 64         ; Czy naci�ni�to 'd' (w prawo)?
JZ Right
CMP AL, 20         ; Czy naci�ni�to 'spacja' (Enter)?
JZ Endl

RET                ; Zako�czenie procedury obs�ugi przerwania

Up:
MOV AL, 8F         ; Ruch w g�r�
OUT 04
JMP Done

Left:
MOV AL, 2F         ; Ruch w lewo
OUT 04
JMP Done

Down:
MOV AL, 4F         ; Ruch w d�
OUT 04
JMP Done

Right:
MOV AL, 1F         ; Ruch w prawo
OUT 04
JMP Done

Endl:
MOV AL, 0          ; Przej�cie do nowej linii (resetowanie)
OUT 04

Done:
IRET               ; Powr�t z procedury obs�ugi przerwania

Start:
STI
OUT 07             ; Wysy�anie danych na port 07 (inicjalizacja klawiatury)
CALL 20            ; Wywo�anie procedury obs�ugi przerwania klawiatury
JMP Start

END
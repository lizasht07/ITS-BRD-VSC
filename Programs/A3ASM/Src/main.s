;************************************************
;* Beginn der globalen Daten *
;************************************************
                   AREA MyData, DATA, align = 2
Base
VariableA          DCW 0x1234
VariableB          DCW 0x4711

VariableC          DCD  0

MeinHalbwortFeld   DCW 0x22 , 0x3e , -52, 78 , 0x27 , 0x45

MeinWortFeld       DCD 0x12345678 , 0x9dca5986
                   DCD -872415232 , 1308622848
                   DCD 0x27000000
                   DCD 0x45000000

MeinTextFeld       DCB "ABab0123",0

                   EXPORT VariableA
                   EXPORT VariableB
                   EXPORT VariableC
                   EXPORT MeinHalbwortFeld
                   EXPORT MeinWortFeld
                   EXPORT MeinTextFeld

;***********************************************
;* Beginn des Programms *
;************************************************
    AREA |.text|, CODE, READONLY, ALIGN = 3
; ----- S t a r t des Hauptprogramms -----
                EXPORT main
                EXTERN initITSboard
main            PROC
                bl    initITSboard                 ; HW Initialisieren

; Laden von Konstanten in Register
                mov   r0,#0x12                      ; Anw-01 (laden einer 8-Bit Konstanten)
                mov   r1,#-128                      ; Anw-02 (laden einer negativen Konstante)
                ldr   r2,=0x12345678                ; Anw-03 (laden einer 32-Bit Konstanten über Literal Pool)

; Zugriff auf Variable
                ldr   r0,=VariableA                 ; Anw-04 (laden der Speicheradresse von VariableA)
                ldrh  r1,[r0]                       ; Anw-05 (laden 2 Bytes (Halbwort) in r0)
                ldr   r2,[r0]                       ; Anw-06 (laden 4 Bytes von der Adresse in r0)
                str   r2,[r0,#VariableC-VariableA]  ; Anw-07 (speichern von r2 an der berechneten Adresse von VariableC)

; Zugriff auf Felder (Speicherzellen)
                ldr   r0,=MeinHalbwortFeld          ; Anw-08 (laden der Adresse des Halbwort-Feldes)
                ldrh  r1,[r0]                       ; Anw-09 (laden des ersten Elements des Feldes)
                ldrh  r2,[r0,#2]                    ; Anw-10 (laden des zweiten Elements des Feldes)
                mov   r3,#10                        ; Anw-11 (laden eines Indexwerts in ein Register)
                ldrh  r4,[r0,r3]                    ; Anw-12 (laden mit Registeroffset)

                ldrh  r5,[r0,#2]!                   ; Anw-13 (Pre-indexing: Adresse in r0 um 2 erhöhen und dann Halbwort laden)
                ldrh  r6,[r0,#2]!                   ; Anw-14 (Pre-indexing: Aresse erneut um zwei erhöhen und nächstes Halbwort laden)
                strh  r6,[r0,#2]!                   ; Anw-15 (Pre- indexing: Adresse um zwei erhöhen und Halbwort in r6 speichern)

; Addition und Subtraktion von unsigned / signed Integer-Werten
                ldr  r0,=MeinWortFeld               ; Anw-16 (Laden der Adresse des Wort-Feldes)
                ldr  r1,[r0]                        ; Anw-17 (laden des ersten Elements des Feldes, 4 Bytes)
                ldr  r2,[r0,#4]                     ; Anw-18 (laden des zwiten 4 Bytes Elements mit Offset)
                adds r3,r1,r2                       ; Anw-19 (Addition der beiden Werte in r1 und r2, Ergebnis in r3)

                ldr  r4,[r0,#8]                     ; Anw-20 (laden des dritten Elements des Feldes mit Offset, 4 Bytes)
                ldr  r5,[r0,#12]                    ; Anw-21 (laden des vierten Elements des Feldes mit Offset, 4 Bytes)
                subs r6,r4,r5                       ; Anw-22 (Subtraktion der beiden Werte in r4 und r5, Ergebnis in r6)

                ldr  r7,[r0,#16]                    ; Anw-23 (laden des fünften Elements des Feldes mit Offset, 4 Bytes)
                ldr  r8,[r0,#20]                    ; Anw-24 (laden des sechsten Elements des Feldes mit Offset, 4 Bytes)
                subs r9,r7,r8                       ; Anw-25 (Subtraktion der beiden Werte in r7 und r8, Ergebnis in r9)

forever         b   forever                         ; Anw-26 (Endlosschleife, Sprung zum Label)
                ENDP
                END
;******************** (C) COPYRIGHT HAW-Hamburg ********************************
;* File Name          : main.s
;* Author             : Martin Becke    
;* Version            : V1.0
;* Date               : 01.06.2021
;* Description        : This is a simple main to demonstrate data transfer
;                     : and manipulation.
;                     : 
;
;*******************************************************************************
    EXTERN initITSboard ; Helper to organize the setup of the board

    EXPORT main         ; we need this for the linker - In this context it set the entry point,too

ConstByteA  EQU 0xaffe
    
;* We need some data to work on
    AREA DATA, DATA, align=2    
VariableA   DCW 0xbeef
VariableB   DCW 0x1234
VariableC   DCW 0x0000

;* We need minimal memory setup of InRootSection placed in Code Section 
    AREA  |.text|, CODE, READONLY, ALIGN = 3    
    ALIGN   
main
    BL initITSboard             ; needed by the board to setup
;* swap memory - Is there another, at least optimized approach?
    ldr     R0,=VariableA   ; Anw01 - 0x2000000c
    ldrb    R2,[R0]         ; Anw02 - R2 = 0xef
    ldrb    R3,[R0,#1]      ; Anw03 - R3 = 0xbe
    lsl     R2, #8          ; Anw04 - R2 = 0xef00
    orr     R2, R3          ; Anw05 - R2 = 0xefbe
    strh    R2,[R0]         ; Anw06 - VariableA = 0xefbe
    
;* const in var
    mov     R5,#ConstByteA  ; Anw07 
    strh    R5,[R0]         ; Anw08 
    ldr     R4, =VariableC  ; Anw09 
    ldrb    R2,[R4]         ; Anw0A
    ldrb    R3,[R4,#1]      ; Anw0B
    lsl     R3, #8          ; Anw0C
    orr     R2, R3          ; Anw0D
    strh    R2,[R4]         ; Anw0E

;* Change value from x1234 to x4321
    ldr     R1,=VariableB   ; Anw0F                                                       
    ldrh    R6,[R1]         ; Anw10
    rev16   R6, R6          ; Anw11 - Reverse byte order in each halfword independently.git
    strh    R6,[R1]         ; Anw12
    b .                     ; Anw13
    
    ALIGN
    END
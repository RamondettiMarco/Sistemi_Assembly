; multi-segment executable file template.

;ESERCIZIO 17
;RAMONDETTI MARCO
;Assegnare due valori a scelta a 2 variabili A e B, incrementare la minore di uno finché non
;diventa uguale alla maggiore.
data segment
    ; add your data here!
    A DB 4
    B DB 7
    pkey db "press any key...$"
ends

stack segment
    dw   128  dup(0)
ends

code segment
start:
; set segment registers:
    mov ax, data
    mov ds, ax
    mov es, ax

    ; add your code here
    MOV AH, A
    CMP AH, B
    JB AMinore
    
BMinore:
    MOV AL, A
    CMP B, AL
    JE Fine
    INC B
    JMP BMinore
    
AMinore:
    MOV AL, B
    CMP A, AL
    JE Fine
    INC A
    JMP AMinore
    
    
Fine:
            
    lea dx, pkey
    mov ah, 9
    int 21h        ; output string at ds:dx
    
    ; wait for any key....    
    mov ah, 1
    int 21h
    
    mov ax, 4c00h ; exit to operating system.
    int 21h    
ends

end start ; set entry point and stop the assembler.

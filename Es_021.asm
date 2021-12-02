; multi-segment executable file template.

;ESERCIZIO 21
;RAMONDETTI MARCO
;Calcolare il prodotto di due numeri scelti a piacere, usando solo istruzioni di somma.
data segment
    ; add your data here! 
    N1       DB 5
    N2       DB 4
    PRODOTTO DB 0
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
    MOV CX, 0
    MOV CL, N1          ;definisco quanti cicli eseguire (CX)
    MOV AH, N2
    
Iniziociclo:
    
    ADD PRODOTTO, AH    ;sommo N2 per N1 volte
    
    LOOP Iniziociclo    ;decrementa CX di 1 e controlla se e' = 0, se si termina il ciclo
                        ;altrimenti torna ad inizio ciclo
    
            
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

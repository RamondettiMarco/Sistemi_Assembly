; multi-segment executable file template.

;ESERCIZIO 15
;RAMONDETTI MARCO
;Dopo avere inizializzato la variabile N con un valore a piacere, caricare nella variabile NUM
;i primi N numeri pari.
data segment
    ; add your data here!
    
    N     DB 4
    NUM   DB 0
    
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
    MOV CL, N       ;N e' il numero di cicli da fare
    
Iniziociclo:    
    ADD NUM, 2
    LOOP Iniziociclo
            
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

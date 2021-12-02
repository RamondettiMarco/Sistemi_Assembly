; esempio di ciclo pre condizionale (con controllo in testa)
;
; inizializzare due numeri num e cont ad un valore a scelta,
; incrementare il numero num di uno per cont volte


data segment
    ; add your data here!
    cont db 4 
    num db ?
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
    
    mov num,2

iniziociclo:
    cmp cont,0
    jbe fineciclo   ; se cont e' minore o uguale a zero salto all'etichetta "fine" ed esco dal ciclo
    dec cont        ; se cont non e' zero lo decremento
    inc num         ; istruzioni ciclo
    jmp iniziociclo ; terminate le istruzioni del corpo del ciclo torno all'etichetta "ciclo"
                    ; e confronto il cont con zero
fineciclo:
    
    mov ax, 4c00h ; exit to operating system.
    int 21h    
ends

end start ; set entry point and stop the assembler.

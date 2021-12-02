; esempio di ciclo post condizionale (con controllo in coda)
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

iniziociclo:        ;inizio istruzioni del ciclo
    inc num     
    dec cont        ; decremento il contatore
    cmp cont,0      ; finche' non diventa zero
    ja iniziociclo  ; se non e' zero salto alla etichetta "ciclo", se e' zero esco dal ciclo
    
    mov ax, 4c00h ; exit to operating system.
    int 21h    
ends

end start ; set entry point and stop the assembler.

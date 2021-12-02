; multi-segment executable file template.
;Dare in input un numero N senza echo; eseguire la ricerca del numero N contando i
;tentativi.

data segment
    ; add your data here!
    pkey db "press any key...$"
    str00 db "Inserire il numero da indovinare: $"
    str01 db "Inserisci un numero: $"
    str02 db "Hai indovinato!!$"
    str03 db "Non hai indovinato$"
    str04 db "NUMERO DI TENTATIVI: $"
    acapo db 10,13, "$"
    giusto db ?
    prova db ?
    conta db 1
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
    
    ;visualizzo la stringa 00
    lea dx, str00
    mov ah, 09h
    int 21h     
    
    ;chiado in input il numero senza usare la echo
    mov ah, 07
    int 21h
    mov giusto, al
    
    ;va a capo
    lea dx, acapo
    mov ah, 09h
    int 21h  
          
    ;visualizzo la stringa 01
    lea dx, str01
    mov ah, 09h
    int 21h 
    
    ;chiedo in input il valore
    mov ah, 01
    int 21h
    mov prova, al
    ;va a capo         
    lea dx, acapo
    mov ah, 09
    int 21h 
    mov ah, prova 
    cmp ah, giusto
    ;se il valore non e' uguale lo richiedo in input 
    ;e incremento la variabile conta
    jne PROVANOUGUALE 
    ; se sono uguali va alla fine e stampa a video il numero di tentativi
    jmp fine
    
    
PROVANOUGUALE:
    lea dx, str03
    mov ah, 09h
    int 21h
    
    ;va a capo         
    lea dx, acapo
    mov ah, 09
    int 21h 
    
    ;visualizzo la stringa 01
    lea dx, str01
    mov ah, 09h
    int 21h
    
    ;chiedo in input il valore
    mov ah, 01
    int 21h
    mov prova, al
    
    ;incremento conta
    inc conta
    
    ;va a capo         
    lea dx, acapo
    mov ah, 09
    int 21h  
    
    ;se il valore non e' uguale lo richiedo in input 
    ;e incremento la variabile conta
    mov ah, prova
    cmp ah, giusto
    jne provanouguale 
    
    ; se sono uguali va alla fine e stampa a video il numero di tentativi
    jmp fine
fine:
    ;stampo a video la stringa hai indovinato 
    lea dx, str02
    mov ah,09h
    int 21h        
    
    ;vado a capo
    lea dx, acapo
    mov ah, 09
    int 21h
    
    ;stampo il numero di tentativi
    lea dx, str04
    mov ah, 09h
    int 21h 
    
    ;sottraggo 30 a conta
    add conta, 30h
    mov dl, conta
    mov ah, 02
    int 21h
    
    ;vado a capo
    lea dx, acapo
    mov ah, 09
    int 21h
            
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

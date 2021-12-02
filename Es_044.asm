; multi-segment executable file template.
;Dati in input A e B, calcolare A elevato a B usando solo operazioni di moltiplicazione.
data segment
    ; add your data here!
    str00 db "Inserire il numero A: $"
    str01 db "Inserire il numero B: $" 
    str02 db "Il numero A elevato a B e': $"
    numA db ?
    numB db ?
    acapo db 13, 10, "$"  
    prodotto db 1
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
    
    ;stampo a video la stringa
    lea dx, str00
    mov ah, 09h
    int 21h
    
    ;chiedo in input il numero A
    mov ah, 01
    int 21h
    mov numA, al
    
    ;sottraggo 30
    sub numA, 30h
     
    
    ;vado a capo
    lea dx, acapo
    mov ah, 09h
    int 21h
    
    ;stampo a video la stringa
    lea dx, str01
    mov ah, 09h
    int 21h
    
    ;chiedo in input il numero B
    mov ah, 01
    int 21h
    mov numB, al
    ;sottraggo 30
    sub numB, 30h 
    
    ;vado a capo
    lea dx, acapo
    mov ah, 09h
    int 21h 
    
    
    mov cx, 0
    mov cl, numB 
    mov ah, numA
    mov prodotto, 1h
    
INIZIOCICLO: 
    ;moltiplico il numero per numB volte
    mov al, prodotto
    mov bl, numA
    mul bl 
    
    mov prodotto, al 
    
loop INIZIOCICLO
    
    ;sommo 30
    add prodotto, 30h 
    
    ;stampo la stringa 
    lea dx, str02
    mov ah, 09h
    int 21h
    
    
    mov dl, prodotto
    mov ah, 02
    int 21h
    
    ;vado a capo
    lea dx, acapo
    mov ah, 09h
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

; multi-segment executable file template.
data segment
    ; add your data here!   
    STRING00 db "DA LETTERA MINUSCOLA A MINUSCOLA$"
    STRING01 db "inserisci la lettera: $"
    STRING02 db "Inserisci quante volte ripetere il codice $"
    STRING03 db "La lettera maiuscola e': $"
    acapo db 13, 10, "$" 
    
    minuscolo db ?
    maiuscolo db ?
    nvolte db ?
    
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
    
    
    lea dx, string00    ;stringa 00
    mov ah, 09
    int 21h
    
    lea dx, acapo      ;acapo
    mov ah, 09
    int 21h
    
    lea dx, string02     ;string02
    mov ah, 09
    int 21h 
    
    mov ah, 01
    int 21h
    mov nvolte, al
    sub nvolte, 30h   
    
    lea dx, acapo      ;acapo
    mov ah, 09
    int 21h
    
    mov cx, 0
    mov cl, nvolte
    
INIZIOCICLO:

    lea dx, string01    ;string01
    mov ah, 09                   
    int 21h
    
      
    
    mov ah, 01
    int 21h
    mov minuscolo, al    
    
    lea dx, acapo      ;acapo
    mov ah, 09
    int 21h
    
    sub minuscolo, 20h
    
    mov al, minuscolo
    mov maiuscolo, al
    
    lea dx, string03
    mov ah, 09
    int 21h
    
    mov dl, maiuscolo
    mov ah, 02
    int 21h
               
    lea dx, acapo      ;acapo
    mov ah, 09
    int 21h
    
    lea dx, acapo      ;acapo
    mov ah, 09
    int 21h
    
    
loop INIZIOCICLO
        
    
    
    
    
            
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

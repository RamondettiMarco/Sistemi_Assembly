; multi-segment executable file template. 


data segment
    ; add your data here!
    stringa00 db "Inserire il numero di cicli $" 
    stringa02 db "I numeri pari sono $"
    acapo db 13, 10,"$" 
    Numerocicli db ?
    Num db 0
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
    
    lea dx, stringa00
    mov ah, 09
    int 21h  
    
    mov ah, 01 
    int 21h
    
    mov Numerocicli, al
    sub Numerocicli, 30h
    
    
    lea dx, acapo
    mov ah, 09
    int 21h
    
   
    
    mov cx, 0
    mov cl, Numerocicli
    
Iniziociclo:


    
      
    add Num, 30h
    
    
    lea dx, stringa02
    mov ah, 09
    int 21h 
    
    
    mov dl, Num
    mov ah, 02
    int 21h
    
    sub Num, 30h    
    
    Add Num, 2
    
    lea dx, acapo
    mov ah, 09
    int 21h

    loop Iniziociclo
    
       
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
; multi-segment executable file template.
;Dopo avere dato in input N, stampare la somma dei primi N numeri naturali.
data segment
    ; add your data here!
    str00 db "Inserire quanti numeri naturali stampare: $"
    str01 db "Somma: $"
    volte db ?
    num db ?
    acapo db 13, 10, "$" 
    somma db 0 
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
    
    ;chiedo in input il numero di volte
    mov ah, 01
    int 21h
    mov volte, al
    
    ;sottraggo 30
    sub volte, 30h
     
    
    ;vado a capo
    lea dx, acapo
    mov ah, 09h
    int 21h
     
    mov cx, 0
    mov cl, volte 
    mov ah, volte
    
INIZIOCICLO:      
      
    mov ah, num
    add somma, ah  
    inc num 
    
    
loop INIZIOCICLO
    
    ;sommo 30
    add somma, 30h 
    
    ;stampo la stringa 
    lea dx, str01
    mov ah, 09h
    int 21h
    
    
    mov dl, somma
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

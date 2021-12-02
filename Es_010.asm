; multi-segment executable file template. 
;
;ES 10 - Verificare se il contenuto della variabile A è maggiore, minore o uguale a 2.
;Se è maggiore impostare AH a 1, se è minore impostare AL a 1, se è uguale impostare BL a 1. 
;
data segment
    ; add your data here! 
    
    a db ?
    
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
     
    mov a,1h
    
    cmp a,2h
    
    ja maggiore    ; se a > 2
     
    jb minore      ; se a < 2
     
    mov bl, 1h     ; se a = 2
    jmp fine
 
 maggiore:    
    mov ah,1h
    jmp fine 
 
 minore:
   mov al, 1h
  
 fine:
 
            
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

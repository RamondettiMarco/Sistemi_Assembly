; multi-segment executable file template.

data segment
    ; add your data here!
      numero1 db  5h        ; dichiarazione e inizializzazione di numero1
      numero2 db  ?         ; dichiarazione di numero2
      risultato dw  ?       ; dichiarazione di risultato
      
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
    mov al, 4h      ;il primo operando si trova in al
    mov bl, 3h      ; il secondo operando si trova in un registro
    mul bl
    
    mov numero2, 3h     ; inizializzazione di numero2
    mov al, numero1 
    mul numero2  
    mov risultato, ax
            
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

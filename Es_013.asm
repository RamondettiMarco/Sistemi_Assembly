; multi-segment executable file template.

data segment
    ; add your data here!
    
    NUM1 DB 4
    NUM2 DB 5
    NUM3 DB 6
    MAX  DB ?
    
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
    
    MOV AL, NUM1
    CMP NUM2, AL
    JA  PrimoMaggiore
    
    MOV AH, NUM2
    JMP Fine
    
    
    
PrimoMaggiore:
    MOV AH, NUM1 
    CMP NUM3, AH
    JA  Maggiore
    
Fine:
    CMP NUM3, AH
    JA  Maggiore
    
    
Maggiore:
    MOV AH, NUM3
    MOV MAX, AH    
            
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

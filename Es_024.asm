; multi-segment executable file template.

data segment
    ; add your data here!  
    A    DB 3
    B    DB 8 
    CONT DB 0
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
    MOV BL, B
    MOV BH, 2
    
Iniziociclo:
    
    MOV AX, 0
    MOV AL, A
    DIV BH
    
    CMP AH, 1
    JNE Pari  
       
    INC CONT
    
Pari: 

    INC A
    CMP BL, A
    JA Iniziociclo
            
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

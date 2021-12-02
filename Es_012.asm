; multi-segment executable file template.

data segment
    ; add your data here! 
    
    NUM1 DW 0Bh
    NUM2 DB 06h
    RIS  DB ?
    
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
    
    MOV AX, NUM1
    MOV BL, NUM2
    
    DIV BL
    
    CMP AH, 0h
    
    JE Multiplo
    
    MOV RIS, 0h
    
    JMP Fine
    
    
Multiplo:
    MOV RIS, 1h
    
Fine:

            
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

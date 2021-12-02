; multi-segment executable file template.

data segment
    ; add your data here! 
    A    DB 2
    B    DB 7  
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
    
    MOV AL, A 
    MOV BL, B
    
    CMP AL, BL
    JLE IniziocicloA 
    
IniziocicloB:
    
    INC CONT
    SUB AL, BL 
    CMP AL, BL 
    MOV A, AL
    JA IniziocicloB
    
    JMP fine  
    
IniziocicloA:  
    
    INC CONT
    SUB BL, AL  
    CMP BL, AL  
    MOV B, BL
    JA IniziocicloA
    
    JMP fine
     
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

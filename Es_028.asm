; multi-segment executable file template.

data segment
    ; add your data here!
    pkey db "press any key...$"   
    
    STR00 DB "SOMMA E DIFFERENZA DI DUE NUMERI $"
    STR01 DB "inserisci il primo numero $"
    STR02 DB "inserisci il secondo numero $"
    STR03 DB "la somma e $"   
    STR04 DB "la differenza e $"
    ACAPO DB 13, 10, "$"
    
    OP1 DB ?
    OP2 DB ?
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
    
    LEA DX, STR00
    MOV AH, 09
    INT 21h
    
    LEA DX, ACAPO
    MOV AH, 09 
    INT 21h
    
    LEA DX, STR01
    MOV AH, 09
    INT 21h
    
    MOV AH, 01  
    
    INT 21h
    MOV OP1, AL    
    
    LEA DX, ACAPO
    MOV AH, 09
    INT 21h  
    
    LEA DX, STR02
    MOV AH, 09
    INT 21h  
    
    MOV AH, 01  
    
    INT 21h
    MOV OP2, AL    
    
    LEA DX, ACAPO
    MOV AH, 09
    INT 21h
    
    LEA DX, STR03
    MOV AH, 09
    INT 21h
    
    MOV DL, OP1
    SUB DL, 30h 
     
    MOV BL, OP2
    SUB BL, 30h 
    
    ADD DL, BL
    ADD DL, 30h 
    MOV AH, 02
    INT 21h      
    
    LEA DX, ACAPO
    MOV AH, 09
    INT 21h
 
    LEA DX, STR04
    MOV AH, 09
    INT 21h
       
    MOV AL, OP1    
    
    SUB AL, 30h
    SUB OP2, 30h
    
    CMP AL, OP2    
    JAE PrimoMaggiore 
    
    SUB OP2, AL      
    
    MOV DL, OP2 
    ADD DL, 30h
    MOV AH, 02
    INT 21h        
    
    JMP Fine
    
PrimoMaggiore:
    SUB AL, OP2      
    
    MOV DL, AL  
    ADD DL, 30h
    MOV AH, 02
    INT 21h
    
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

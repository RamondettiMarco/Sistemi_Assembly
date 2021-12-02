; multi-segment executable file template.

data segment
    ; add your data here!
    pkey db "press any key...$"       
    STR00 DB "SOMMA DI TRE NUMERI $"
    STR01 DB "inserisci il primo numero $"
    STR02 DB "inserisci il secondo numero $"
    STR03 DB "inserisci il terzo numero $"
    STR04 DB "la somma e $"              
    ACAPO DB 13, 10, "$"
    
    OP1 DB ?
    OP2 DB ?    
    OP3 DB ?
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
    
Inizio1:    
    LEA DX, STR01
    MOV AH, 09
    INT 21h
    
    MOV AH, 01  
    
    INT 21h
    MOV OP1, AL 
                 
    
    LEA DX, ACAPO
    MOV AH, 09 
    INT 21h              
                 
    CMP OP1, 35h
    JA Inizio1    
     
Inizio2:    
    LEA DX, STR02
    MOV AH, 09
    INT 21h  
    
    MOV AH, 01  
    
    INT 21h
    MOV OP2, AL  
    
    LEA DX, ACAPO
    MOV AH, 09
    INT 21h  
    
    CMP OP2, 35h
    JA Inizio2
    
Inizio3:    
    LEA DX, STR03
    MOV AH, 09
    INT 21h    
    
    MOV AH, 01  
    
    INT 21h
    MOV OP3, AL    
    
    LEA DX, ACAPO
    MOV AH, 09 
    INT 21h 
    
    CMP OP3, 35h
    JA Inizio3
    
    LEA DX, ACAPO
    MOV AH, 09
    INT 21h    
    
    LEA DX, STR04
    MOV AH, 09
    INT 21h   
    
    SUB OP1, 30h
    SUB OP2, 30h
    SUB OP3, 30h
    
    MOV DL, OP1
    ADD DL, OP2
    ADD DL, OP3
    
    ADD DL, 30h
    MOV AH, 02
    INT 21h
    
    LEA DX, ACAPO
    MOV AH, 09 
    INT 21h 
    
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

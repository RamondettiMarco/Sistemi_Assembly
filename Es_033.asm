; multi-segment executable file template.

data segment
    ; add your data here!
    pkey db "press any key...$"   
    STR00 DB "Inserisci un numero  $"   
    STR01 DB "Inserisci quanti numeri vuoi inseriere: $"   
    STR02 DB "I numeri pari sono: $" 
    STR03 DB "I numeri dispari sono: $"
    ACAPO DB 13, 10, "$" 
     
    N2      DB 2h 
    N       DB ?
    PARI    DB 0
    DISPARI DB 0  
    NUM     DB ?
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
    
    LEA DX, STR01
    MOV AH, 09
    INT 21h
    
    MOV AH, 01
    
    INT 21h
    MOV NUM, AL 
    
    LEA DX, ACAPO
    MOV AH, 09
    INT 21h     
    
    SUB NUM, 30h
    
    MOV CX, 0  
    MOV CL, NUM

Iniziociclo:

    LEA DX, STR00
    MOV AH, 09
    INT 21h
    
    MOV AH, 01
    INT 21h      
    
    MOV N, AL
    
    LEA DX, ACAPO
    MOV AH, 09
    INT 21h    
    
    MOV AL, N
    
    SUB AL, 30h   
    MOV AH, 0  
    
    DIV N2      
    
    CMP AH, 0
    JE NumPari
             
    INC DISPARI    
    
    JMP Fine
    
NumPari:
     
    INC PARI 
     
Fine:     

    LOOP Iniziociclo
    
    LEA DX, STR02
    MOV AH, 09
    INT 21h  
    
    MOV DL, PARI  
    ADD DL, 30h
    MOV AH, 02
    INT 21h     
    
    LEA DX, ACAPO
    MOV AH, 09
    INT 21h 
    
    LEA DX, STR03
    MOV AH, 09
    INT 21h  
    
    MOV DL, DISPARI 
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

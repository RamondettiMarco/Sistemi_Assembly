; multi-segment executable file template.

data segment
    ; add your data here!  
    STR00 DB "Inserisci il numero di numeri: $"
    STR01 DB "Inserisci un numero: $"
    STR02 DB "La somma pari e' $"
    STR03 DB "La somma dispari e' $" 
    ACAPO DB 13, 10, "$" 
    
    N      DB ? 
    NUM    DB ?
    SOMMAP DB 0
    SOMMAD DB 0 
    D      DB 2
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
    LEA DX, STR00
    MOV AH, 09
    INT 21h    
    
    MOV AH, 01
    INT 21h
    
    MOV N, AL
    SUB N, 30h
    
    LEA DX, ACAPO
    MOV AH, 09
    INT 21h
    
    MOV CX, 0
    MOV CL, N
    
Iniziociclo:

    LEA DX, STR01
    MOV AH, 09
    INT 21h
    
    MOV AH, 01
    INT 21h
    
    MOV NUM, AL  
    
    MOV AH, 0
    DIV D
    
    CMP AH, 0
    JE Pari   
    
    
    MOV BL, NUM
    SUB BL, 30h
    ADD SOMMAD, BL 
     
    JMP Fine
    
Pari:
     
    MOV BL, NUM
    SUB BL, 30h
    ADD SOMMAP, BL  
    
Fine: 

    LEA DX, ACAPO
    MOV AH, 09
    INT 21h
    
    LOOP Iniziociclo
    
    LEA DX, STR02
    MOV AH, 09
    INT 21h  
    
    ADD SOMMAP, 30h
    
    MOV DL, SOMMAP
    
    MOV AH, 02
    INT 21h    
    
    LEA DX, ACAPO
    MOV AH, 09
    INT 21h
    
    LEA DX, STR03
    MOV AH, 09
    INT 21h  
    
    ADD SOMMAD, 30h
    
    MOV DL, SOMMAD
    
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

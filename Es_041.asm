; multi-segment executable file template.

data segment
    ; add your data here! 
    STR00 DB "Inserisci il numero di partenza: $"   
    STR01 DB "Inserisci quanti numeri vuoi inseriere: $"   
    ACAPO DB 13, 10, "$"    
    N     DB ?    
    A     DB ? 
    OP    DB 1  
    PROD  DW ?
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
    LEA DX, STR00           ;inserisco il numero A
    MOV AH, 09
    INT 21h
    
    MOV AH, 01
    
    INT 21h
    MOV A, AL    
    
    LEA DX, ACAPO
    MOV AH, 09
    INT 21h      
    
    SUB A, 30h
    
    LEA DX, STR01           ;inserisco in numero N
    MOV AH, 09
    INT 21h
    
    MOV AH, 01
    
    INT 21h
    MOV N, AL
    
    SUB N, 30h
    
    MOV CX, 0              ;azzero cx e imposto N come contatore
    MOV CL, N 
    
    LEA DX, ACAPO
    MOV AH, 09
    INT 21h
    
Iniziociclo:
    
    MOV AL, A
    MOV BL, OP
    
    MUL BL                ;moltiplico A per OP
    
    MOV PROD, AX
    
    ADD PROD, 30h         ;aggiungo 30h per stampare il prodotto
    
    MOV DX, PROD          ;stampo il prodotto
    MOV AH, 02
    INT 21h   
    
    LEA DX, ACAPO
    MOV AH, 09
    INT 21h
    
    INC OP                ;incremento OP per aumentare il fattore della moltiplicazione
    
    LOOP Iniziociclo
    
            
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

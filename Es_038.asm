; multi-segment executable file template.

data segment
    ; add your data here!      
    STR01 DB "Inserisci quanti numeri vuoi inseriere: $"   
    ACAPO DB 13, 10, "$"    
    NUM   DB ?    
    N     DB 30h
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

    MOV DL, N
    MOV AH, 02
    INT 21h  
    
    LEA DX, ACAPO
    MOV AH, 09
    INT 21h
    
    INC N 

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

; multi-segment executable file template.

data segment
    ; add your data here!
    pkey db "press any key...$"
    STR00 DB "Inserisci un numero  $"
    STR01 DB "Pari $"
    STR02 DB "Dispari $"
    ACAPO DB 13, 10, "$" 
    
    N     DB ?  
    N2    DB 2h
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
    MOV AH, 0  
    
    DIV N2      
    
    CMP AH, 0
    JE Pari
             
    LEA DX, ACAPO
    MOV AH, 09
    INT 21h
    
    LEA DX, STR02
    MOV AH, 09
    INT 21h    
    
    JMP Fine
    
Pari:
     
    LEA DX, ACAPO
    MOV AH, 09
    INT 21h     
    
    LEA DX, STR01
    MOV AH, 09
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

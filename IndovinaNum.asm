; multi-segment executable file template.

data segment
    ; add your data here! 
    STR00 DB "Inserisci il numero da indovinare: $"
    STR01 DB "Inserisci un numero: $"
    STR02 DB "HAI INDOVINATO! $" 
    STR03 DB "Il numero e': $"
    STR04 DB "Numero di tentativi: $" 
    ACAPO DB 13, 10, "$"
    
    N   DB ? 
    NUM DB ? 
    NT  DB 0
    
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
    MOV AH, 09h
    INT 21h
    
    MOV AH, 07
    INT 21h
    
    MOV N, AL 
    
    LEA DX, ACAPO
    MOV AH, 09h
    INT 21h
    
Inizio:  

    INC NT

    LEA DX, STR01
    MOV AH, 09h
    INT 21h
    
    MOV AH, 01
    INT 21h   
    
    MOV NUM, AL
    
    LEA DX, ACAPO
    MOV AH, 09h
    INT 21h
  
    MOV BL, NUM
      
    CMP BL, N 
    JNE Inizio
    
    LEA DX, STR02
    MOV AH, 09h
    INT 21h    
    
    LEA DX, ACAPO
    MOV AH, 09h
    INT 21h
    
    LEA DX, STR03
    MOV AH, 09h
    INT 21h
    
    MOV DL, N
    MOV AH, 02 
    INT 21h  
    
    LEA DX, ACAPO
    MOV AH, 09h
    INT 21h   
    
    LEA DX, STR04
    MOV AH, 09h
    INT 21h
  
    ADD NT, 30h
      
    MOV DL, NT
    MOV AH, 02
    INT 21h  
    
    LEA DX, ACAPO
    MOV AH, 09h
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

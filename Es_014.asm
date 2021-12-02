; multi-segment executable file template.

data segment
    ; add your data here!
    
    NUM1 dw 1h
    NUM2 dw 2h
    NUM3 dw 3h
    NUM4 dw 4h
    SOMMAPARI Dw 0h
    SOMMADISPARI Dw 0h
    
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
    MOV BL, 2h
    DIV BL    
    CMP AH, 0h
    JE  PARI
    
    MOV BX, NUM1
    ADD SOMMADISPARI, BX 
    
   
    JMP FINE
    
    
PARI:
    MOV AX, NUM1
    ADD SOMMAPARI, AX  
                  
    
    
FINE:    
    MOV AX, NUM2 
    MOV BL, 2h
    DIV BL    
    CMP AH, 0h
    JE  PARI2 
    
    MOV BX, NUM2
    ADD SOMMADISPARI, BX
    MOV BX, 0h
    
   
    
    
    JMP FINE2
    
PARI2: 
    MOV AX, NUM2
    ADD SOMMAPARI, AX  
    
    
 
    
    
FINE2:    
    MOV AX, NUM3 
    MOV BL, 2h
    DIV BL    
    CMP AH, 0h
    JE  PARI3 
    
    MOV BX, NUM3
    ADD SOMMADISPARI, BX 
    MOV BX, 0h
   
    
    JMP FINE3
    
    
PARI3:  
    MOV AX, NUM3
    ADD SOMMAPARI, AX  
    
          
    
    
FINE3:    
    MOV AX, NUM4 
    MOV BL, 2h
    DIV BL    
    CMP AH, 0h
    JE  PARI4 
    
    MOV BX, NUM4
    ADD SOMMADISPARI, BX
    MOV BX, 0h
    
    JMP FINE4
    
    
PARI4:  
    MOV AX, NUM4
    ADD SOMMAPARI, AX  
    
    
 
    
FINE4:            
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

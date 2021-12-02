; multi-segment executable file template.

data segment
    ; add your data here!  
    NUM   DB 5
    SOMMA DB 0
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
    MOV CX, 0
    MOV CL, NUM
    
Iniziociclo:    
    
    MOV AX, 0
    MOV AL, CL
    MOV BL, 2
    DIV BL
    
    CMP AH, 0
    JNE Dispari
    
    ADD SOMMA, CL
    
Dispari:   
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

; multi-segment executable file template.

data segment
    ; add your data here! ù     
    
    A     DB 10
    B     DB 15 
    SOMMA DB ?
    CONTA DB ?    
    
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
    
    iniziociclo:
    CMP SOMMA, 50
    JGE fineciclo   ; se somma e' maggiore di 50 salto all'etichetta "fine" ed esco dal ciclo
    INC CONTA       ; incremento conta
    MOV AL, A
    MOV BL, B
    ADD AL, BL
    ADD SOMMA, AL
    JMP iniziociclo ; terminate le istruzioni del corpo del ciclo torno all'etichetta "ciclo"
                    
fineciclo:
    
            
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

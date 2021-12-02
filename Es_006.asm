; multi-segment executable file template.
;
;ES 007 - CARICARE IN AH IL MAGIORE TRA NUM1 E NUM2 (DIVERSI) UTILIZZANDO JA
;
data segment
    ; add your data here!
    
    NUM1 DB 3Ah
    NUM2 DB ?
    
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
    
    MOV NUM2, 1Ah       ; inizializzato la variabile NUM2
    
    MOV AL, NUM2
    CMP NUM1, AL        ; confronto tra NUM1 e NUM2
    JA  primoMaggiore   ; se NUM1 e maggiore di NUM2 salto all'etichetta "primoMaggiore"
    
    MOV AH, NUM2        ; se NUM1 e minore di NUM2
    JMP fine            ; salto incondizionato all'etichetta ""fine
    
    
primoMaggiore:          ; se NUM1 e maggiore di NUM2
    MOV AH, NUM1 
  
fine:
    
    
            
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

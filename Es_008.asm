; multi-segment executable file template.
;
;Caricare due variabili Num1 e Num2 con valori a scelta poi salvare nella variabile Min il
;valore minimo e nella variabile Max il valore massimo.
;
data segment
    ; add your data here!
    
    NUM1 DB 3h
    NUM2 DB 4h
    MIN  DB ?
    MAX  DB ?
    
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
    
    MOV AL, NUM2
    CMP NUM1, AL
    JA  MAGGIOREPRIMO
    
    MOV AH, NUM1
    JMP MINOREPRIMO
    
    
    
    
MAGGIOREPRIMO: 
    MOV AH, NUM1
    MOV MAX, AH
    MOV MIN, AL
    
MINOREPRIMO:
    MOV MIN, AH
    MOV MAX, AL 
    
    
            
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

; multi-segment executable file template.

data segment
    ; add your data here! 
    CONT      DB 3 
    TOTALECIC DB 0
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
    MOV CL, CONT      ;definisco quanti cicli eseguire (CX)
Iniziociclo:

    INC TOTALECIC
    LOOP Iniziociclo  ;LOOP decrementa CX di 1 e controlla se e = 0, se si termina il ciclo
                      ;altrimenti torna ad inizio ciclo
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

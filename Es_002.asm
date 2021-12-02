; multi-segment executable file template.

data segment
    ; add your data here!
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
    mov al, 02h
    add al, 03h   ; 03+al -> al
    
    mov bl, 01h
    add bl, al    ; al+bl -> bl
    
    ;******************************************
    
    sub bl, 03h   ; bl-03 -> bl
    
    mov al, 01h
    sub bl, al    ; bl-al -> bl
    
            
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

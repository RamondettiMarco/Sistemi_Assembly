; multi-segment executable file template.

data segment
    ; add your data here! 
    num1 db 10h
    num2 db  5h
    num3 db  ?
    num4 db  ?
    r1 db  ?
    quoziente db  ?
    resto db  ?
    
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
    mov num3, 7h
    mov num4, 8h
    
    mov al, num3
    mul num4
    mov r1, al
    
    mov al, num1
    mov ah, 0
    div num2
    mov quoziente, al
    mov resto, ah
            
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

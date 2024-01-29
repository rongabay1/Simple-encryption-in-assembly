IDEAL
MODEL small
STACK 100h
DATASEG

; Define the array and the key
msg db 'ASSEMBLY LIKE I$'
key db 8Ch ; 8-bit encryption key

CODESEG
start:
    mov ax, @data
    mov ds, ax

    ; Encryption
    mov si, offset msg
    call encrypt

    ; Print the encrypted message
    mov si, offset msg
    call print

    ; Decryption
    mov si, offset msg
    call decrypt

    ; Print the decrypted message
    mov si, offset msg
    call print

    ; Exit
    mov ax, 4c00h
    int 21h

encrypt:
    lodsb  ;lodsb: Loads the byte at the address pointed to by SI into AL and increments SI.
    cmp al, '$'
    je done_encrypt
    xor al, key
    mov [si-1], al
    jmp encrypt
done_encrypt:
    ret

decrypt:
    lodsb
    cmp al, '$'
    je done_decrypt
    xor al, key
    mov [si-1], al
    jmp decrypt
done_decrypt:
    ret

print:
    mov dx, si
    mov ah, 9h
    int 21h
    mov ah, 2 ; new line
    mov dl, 10
    int 21h
    mov dl, 13
    int 21h
    ret  ;ret: Returns from the function

END start

IDEAL
MODEL small
STACK 100h
DATASEG

; Your variables here

arr dw 0072h ,006Fh ,006Eh ; ASCII values for 'r', 'o', 'n'
enc dw 0,0,0
decr dw 0,0,0

CODESEG
start:
mov ax, @data
mov ds, ax

;encrypt
mov ax,00001111b
mov bx,[arr]
xor bx,ax
mov [enc],bx

mov bx,[arr+2]
xor bx,ax
mov [enc+2],bx

mov bx,[arr+4]
xor bx,ax
mov [enc+4],bx

;decode

mov bx,[enc]
xor bx,ax
mov [decr],bx

mov bx,[enc+2]
xor bx,ax
mov [decr+2],bx

mov bx,[enc+4]
xor bx,ax
mov [decr+4],bx

exit:
mov ax, 4c00h
int 21h
END start

;prints

imprimir macro cadena
    mov ah, 09h
    mov dx, offset cadena
    int 21h
endm

obtenerOpcion macro
    mov ah, 01h
    int 21h
endm


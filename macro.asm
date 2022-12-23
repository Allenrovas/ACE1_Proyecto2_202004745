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

limpiarPantalla macro
    mov ax,03h
	int 10h
endm

leer macro array
    LOCAL obtenerCadena, finCadena
    xor si,si
    obtenerCadena:
        obtenerOpcion
        cmp al, 0Dh
        je finCadena
        mov array[si], al
        inc si
        jmp obtenerCadena
    finCadena:
        mov al,24h
        mov array[si], 0

endm 

obtenerCoeficientes macro
    imprimir stringQuinta; Imprime el string del coeficiente a la quinta
    leer coef5; Lee el coeficiente a la quinta
    ;comprobarCoef coef5; Comprueba que el coeficiente sea un numero valido

    imprimir stringCuarta; Imprime el string del coeficiente a la cuarta
    leer coef4; Lee el coeficiente a la cuarta
    ;comprobarCoef coef4; Comprueba que el coeficiente sea un numero valido

    imprimir stringTercera; Imprime el string del coeficiente a la tercera
    leer coef3; Lee el coeficiente a la tercera
    ;comprobarCoef coef3; Comprueba que el coeficiente sea un numero valido

    imprimir stringSegunda; Imprime el string del coeficiente a la segunda
    leer coef2; Lee el coeficiente a la segunda
    ;comprobarCoef coef2; Comprueba que el coeficiente sea un numero valido

    imprimir stringPrimera; Imprime el string del coeficiente a la primera
    leer coef1; Lee el coeficiente a la primera
    ;comprobarCoef coef1; Comprueba que el coeficiente sea un numero valido

    imprimir stringConstante; Imprime el string del coeficiente constante
    leer coef0; Lee el coeficiente constante
    ;comprobarCoef coef0; Comprueba que el coeficiente sea un numero valido
endm




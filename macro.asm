;prints
imprimir macro cadena;macro para imprimir una cadena de caracteres
    mov ah, 09h
    mov dx, offset cadena
    int 21h
endm

obtenerOpcion macro;macro para obtener una opcion del teclado
    mov ah, 01h
    int 21h
endm

limpiarPantalla macro;macro para limpiar la pantalla
    mov ax,03h
	int 10h
endm

leer macro array;macro para leer una cadena de caracteres
    LOCAL obtenerCadena, finCadena
    xor si,si    
    obtenerCadena:
        obtenerOpcion
        cmp al,0dh
        je finCadena
        mov array[si],al
        inc si
        jmp obtenerCadena
    finCadena:
    mov al,24h
    mov array[si],al
endm 

ingresoFuncionOriginal macro
    imprimir stringQuinta; Imprime el string del coeficiente a la quinta
    leer coef5; Lee el coeficiente a la quinta
    validarEntrada coef5; Comprueba que el coeficiente sea un numero valido
    convertirCoeficiente coef5; Convierte el coeficiente a un numero entero

    imprimir stringCuarta; Imprime el string del coeficiente a la cuarta
    leer coef4; Lee el coeficiente a la cuarta
    validarEntrada coef4; Comprueba que el coeficiente sea un numero valido
    convertirCoeficiente coef4; Convierte el coeficiente a un numero entero

    imprimir stringTercera; Imprime el string del coeficiente a la tercera
    leer coef3; Lee el coeficiente a la tercera
    validarEntrada coef3; Comprueba que el coeficiente sea un numero valido
    convertirCoeficiente coef3; Convierte el coeficiente a un numero entero

    imprimir stringSegunda; Imprime el string del coeficiente a la segunda
    leer coef2; Lee el coeficiente a la segunda
    validarEntrada coef2; Comprueba que el coeficiente sea un numero valido
    convertirCoeficiente coef2; Convierte el coeficiente a un numero entero

    imprimir stringPrimera; Imprime el string del coeficiente a la primera
    leer coef1; Lee el coeficiente a la primera
    validarEntrada coef1; Comprueba que el coeficiente sea un numero valido
    convertirCoeficiente coef1; Convierte el coeficiente a un numero entero

    imprimir stringConstante; Imprime el string del coeficiente constante
    leer coef0; Lee el coeficiente constante
    validarEntrada coef0; Comprueba que el coeficiente sea un numero valido
    convertirCoeficiente coef0; Convierte el coeficiente a un numero entero
endm

funcionMemoria macro
    LOCAL F5,F4,F3,F2,F1,F0,F
    imprimir funcionOriginalString
    cmp coef5 [1],0
    je F4
    getEntero coef5
    imprimir x5
    jmp F4
    F4:
        cmp coef4 [1],0
        je F3
        getEntero coef4
        imprimir x4
    F3:
        cmp coef3 [1],0
        je F2
        getEntero coef3
        imprimir x3
    F2:
        cmp coef2 [1],0
        je F1
        getEntero coef2
        imprimir x2
    F1:
        cmp coef1 [1],0
        je F0
        getEntero coef1
        imprimir x
    F0:
        cmp coef0 [1],0
        je F               
        getEntero coef0
        imprimir salto
    F:
endm

funcionDerivada macro
LOCAL D5,D4,D3,D2,D1,F
    imprimir derivadaString; Imprime el string de la derivada
    xor ax, ax
    xor bx, bx
    xor cx, cx
    cmp coef5 [1],0
    je D4
    D5:
        mov al, coef5[1]
        mov bl, 5
        mul bl
        mov cl, coef5[0]
        mov coefDerivada4[0],cl
        mov coefDerivada4[1],al
        getEntero coefDerivada4
        imprimir x4
    D4:
        cmp coef4 [1],0
        je D3
        mov al, coef4[1]
        mov bl, 4
        mul bl
        mov cl, coef4[0]
        mov coefDerivada3[0],cl
        mov coefDerivada3[1],al
        getEntero coefDerivada3
        imprimir x3
    D3:
        cmp coef3 [1],0
        je D2
        mov al, coef3[1]
        mov bl, 3
        mul bl
        mov cl, coef3[0]
        mov coefDerivada2[0],cl
        mov coefDerivada2[1],al
        getEntero coefDerivada2
        imprimir x2
    D2:
        cmp coef2 [1],0
        je D1
        mov al, coef2[1]
        mov bl, 2
        mul bl
        mov cl, coef2[0]
        mov coefDerivada1[0],cl
        mov coefDerivada1[1],al
        getEntero coefDerivada1
        imprimir x
    D1:
        cmp coef1 [1],0
        je F
        mov al, coef1[1]
        mov bl, 1
        mul bl
        mov cl, coef1[0]
        mov coefDerivada0[0],cl
        mov coefDerivada0[1],al
        getEntero coefDerivada0
        imprimir salto
    F:
        imprimir salto
endm

validarEntrada macro coeficiente
    validarLengthCoeficiente coeficiente
    validarCoefR coeficiente
endm

validarLengthCoeficiente macro coeficiente
    obtenerLengthCoeficiente coeficiente;obtenemos la longitud del coeficiente
    cmp si, 0;comparamos la longitud del coeficiente con 0
    je errorEntradaFuncion;si es 0, error
    cmp si, 3;comparamos la longitud del coeficiente con 3
    jae errorEntradaFuncion;si es 3, error
endm 

validarCoefR macro coeficiente;macro para validar la entrada de un coeficiente
    LOCAL primerC,segundoC,continue,finish 
    cmp si, 1
    je primerC
    jmp segundoC
    primerC:
        comprobarNumero coeficiente[0]
        mov al, coeficiente[0]
        mov coeficiente[1],al
        mov coeficiente[0],43
        jmp finish
    segundoC:
        ;check sign
        cmp coeficiente[0],43      ;+
        je continue     
        cmp coeficiente[0],45      ;-
        je continue
        jmp errorEntradaFuncion
        continue:
            comprobarNumero coeficiente[1]
    finish:
endm

obtenerLengthCoeficiente macro coeficiente
LOCAL while, finish
    xor si,si
    while:
        cmp coeficiente[si],24h
        je finish
        inc si
        jmp while
    finish:
endm


comprobarNumero macro char ;macro para comprobar si un caracter es un numero
LOCAL char,continue
    cmp char, 48
    jge continue
    jmp errorEntradaFuncion
    continue:
        cmp char, 57
        jg errorEntradaFuncion 
endm

LimpiarVariables macro array,lengthB,caracter
 LOCAL repeat 
    mov si,0
    mov cx,0
    mov cx,lengthB
    repeat:
    mov array[si],caracter
    inc si
    loop repeat
endm

convertirCoeficiente macro coeficiente
    xor bl,bl
    mov bl, coeficiente[1]
    sub bl, 48
    mov coeficiente[1], bl
endm


getEntero macro coeficiente
LOCAL printNumber, finish
    cmp coeficiente[1],0
    je finish
    getSigno coeficiente[0]
    xor dx, dx
    mov dl, coeficiente[1]
    convertAscii dx,auxiliar
    imprimir auxiliar
    finish:
endm

getSigno macro signo
LOCAL imprimirMas, imprimirMenos, finish
    cmp signo,43
    je imprimirMas 
    jmp imprimirMenos 
    imprimirMas: 
        imprimir mas
        jmp finish
    imprimirMenos:
        imprimir menos
    finish:
endm


convertAscii macro num,buffer
LOCAL divide,getDigits,cleanRemainder
    xor si, si    
    xor bx, bx      
    xor cx, cx      
    mov bl, 10      
    mov ax, num
    jmp divide
    
    cleanRemainder:
        xor ah,ah
    divide:
        div bl          
        inc cx          
        push ax      
        cmp al, 0      
        je getDigits   
        jmp cleanRemainder
    getDigits:
        pop ax
        add ah,48
        mov buffer[si],ah
        inc si
        loop getDigits
        mov ah, 24h
        mov buffer[si],ah
endm



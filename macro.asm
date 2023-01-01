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

funcionIntegral macro
    LOCAL I6,I5,I4,I3,I2,I1,I0,F
    imprimir integralString
    cmp coef5 [1],0
    je I5
    getEntero coef5
    imprimir division
    imprimir seis
    imprimir x6
    jmp I5
    I5:
        cmp coef4 [1],0
        je I4
        getEntero coef4
        imprimir division
        imprimir cinco
        imprimir x5
    I4:
        cmp coef3 [1],0
        je I3
        getEntero coef3
        imprimir division
        imprimir cuatro
        imprimir x4
    I3:
        cmp coef2 [1],0
        je I2
        getEntero coef2
        imprimir division
        imprimir tres
        imprimir x3
    I2:
        cmp coef1 [1],0
        je I1
        getEntero coef1
        imprimir division
        imprimir dos
        imprimir x2
    I1:
        cmp coef0 [1],0
        je I0
        getEntero coef0
        imprimir x
    I0:
        imprimir constanteIntegracion
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

obtenerRangoGrafico macro ;macro para obtener el rango de la funcion
    imprimir stringInicio 
    leer inicio
    IntervaloGrafica inicio
    convertirN inicio
    imprimir stringFinal
    leer final
    IntervaloGrafica final
    convertirN final
endm

IntervaloGrafica macro intervalo 
LOCAL orden, finish
    obtenerLengthCoeficiente intervalo ;obtenemos la longitud del coeficiente
    cmp si, 2;comparamos la longitud del coeficiente con 2
    je orden
    jmp finish
    orden:
        xor bx, bx
        mov bl, intervalo[0]
        mov bh, intervalo[1]
        mov intervalo[0], 43
        mov intervalo[1], bl
        mov intervalo[2], bh
    finish:
endm

convertirN macro intervalo
LOCAL esN, finish
    xor ax,ax ;limpiamos ax
    xor bx,bx ;limpiamos bx
    xor dx,dx ;limpiamos dx
    mov ax,10 ;movemos 10 a ax
    mov bl,intervalo[1] ;movemos el segundo caracter a bl
    sub bl,48 ;restamos 48 a bl
    mul bx ;multiplicamos bl por 10
    mov dl, intervalo[2] ;movemos el tercer caracter a dl
    sub dl,48 ;restamos 48 a dl
    add al,dl ;sumamos dl a al
    cmp intervalo[0],45 ;comparamos el primer caracter con 45
    je esN ;si es 45, es negativo
    jmp finish ;si no, es positivo

    esN:
        xor ah,ah ;limpiamos ah
        neg al ;negamos al
    finish:
        xor cx, cx;limpiamos cx
        mov cl, intervalo[0];movemos el primer caracter de num a cx
        mov intervalo[0],cl;movemos cx a la primera posicion de num
        mov intervalo[1],al;movemos al a la segunda posicion de num
endm

graficarFuncionOriginal macro
    setGraphicMode
    dibujarEjes
    GradoFuncionOriginal 
    presionarTecla        
    setTextMode     
endm


graficarDerivada macro
    setGraphicMode
    dibujarEjes
    GradoDerivada
    presionarTecla        
    setTextMode    
endm


graficarIntegral macro
    setGraphicMode
    dibujarEjes
    presionarTecla        
    setTextMode     
endm

setGraphicMode macro
    mov ax, 0013h
    int 10h
endm

setTextMode macro
    mov ax, 0003h
    int 10h
endm

presionarTecla macro
    mov ah, 10h
    int 16h
endm


dibujarPixel macro coorX, coorY, color
LOCAL fin
    xor si, si
    mov si, coorY
    cmp si, 0
    jl fin
    cmp si, 200
    jg fin
    pusha
    mov ah, 0ch
    mov al, color
    mov bh, 0h
    mov dx, coorY
    mov cx, coorX
    int 10h
    popa
    fin:
endm


dibujarEjes macro
LOCAL eje_x, eje_y
    xor cx, cx
    mov cx, 320
    eje_x:
        dibujarPixel cx, 100,5fh
        loop eje_x
        mov cx, 200    
    eje_y:
        dibujarPixel 160, cx, 5fh
        loop eje_y
endm



GradoFuncionOriginal macro
LOCAL esCuartoGrado, esCubica, esCuadratica, esLineal, esConstante, finish
    cmp coef4[1], 0
    jne esCuartoGrado
    cmp coef3[1], 0
    jne esCubica
    cmp coef2[1], 0
    jne esCuadratica
    cmp coef1[1], 0
    jne esLineal
    cmp coef0[0], 0
    jne esConstante
    jmp finish


    esCuartoGrado:
        cuartoGrado
        jmp finish
    esCubica:
        tercerGrado coef3, coef2, coef1, coef0
        jmp finish
    esCuadratica:
        Cuadratica coef2, coef1, coef0
        jmp finish
    esLineal:
        Lineal coef1, coef0
        jmp finish
    esConstante:
        Constante coef0
        jmp finish
    finish:
endm

GradoDerivada macro
LOCAL esCuartoGrado, esCubica, esCuadratica, esLineal, esConstante, finish
    cmp coefDerivada4[1], 0
    jne esCuartoGrado
    cmp coefDerivada3[1], 0
    jne esCubica
    cmp coefDerivada2[1], 0
    jne esCuadratica
    cmp coefDerivada1[1], 0
    jne esLineal
    cmp coefDerivada0[0], 0
    jne esConstante
    jmp finish

    esCuartoGrado:
        cuartoGrado
        jmp finish
    esCubica:
        tercerGrado coefDerivada3, coefDerivada2, coefDerivada1, coefDerivada0
        jmp finish
    esCuadratica:
        Cuadratica coefDerivada2, coefDerivada1, coefDerivada0
        jmp finish
    esLineal:
        Lineal coefDerivada1, coefDerivada0
        jmp finish
    esConstante:
        Constante coefDerivada0
        jmp finish
    finish:
endm

cuartoGrado macro 
LOCAL while, is_negative, is_positive, continue, finish
    xor ax, ax; limpiamos ax
    xor bx, bx          
    xor cx, cx       
    mov cl, inicio[1]   ;movemos el segundo caracter de inicio a cx
    mov ch, final[1] ;movemos el segundo caracter de final a ch

    while:
        xor ax, ax; limpiamos ax
        mov bl, 160         ;movemos 160 a bl
        mov dl, 100    ;movemos 100 a dl
        test cl,cl    ;test cl
        js is_negative;si es negativo,
        jmp is_positive;si es positivo
        
        is_negative:
            neg cl;negamos cl
            sub bl, cl     ;restamos cl a bl
            ;y
            gradoX4;llamamos a gradoX4
            neg cl;negamos cl
            jmp continue;continuamos
        is_positive:
            mul cl;multiplicamos cl por 4
            add bl, cl;sumamos cl a bl
            gradoX4;llamamos a gradoX4
            
        continue:
            ;Draw
            dibujarPixel bx, dx, 0ch;dibujamos el pixel
            inc cl;incrementamos cl
            cmp cl, ch;comparamos cl con ch
            jg finish;si es mayor, terminamos
            jmp while ;si no, volvemos a while
    finish:
endm

pushX macro
    push bx
    push cx
    push dx
endm

popX macro
    pop dx
    pop cx
    pop bx
endm

potencia macro exponente, value
LOCAL while, finish
    xor bx, bx
    mov bl, exponente
    mov ax, 1

    cmp bl, 0
    jg while
    jmp finish

    while:
        cmp bx, 1
        jl finish
        mul value
        dec bx
        jmp while
    finish:
endm

gradoX4 macro 
LOCAL coefficient3, coefficient2, coefficient1, coefficient0, minus4,minus3,minus2,minus1,minus, fin
   
    cmp cl, 10
    jg fin

    cmp coef4[0], 45
    je minus4 
    
        pushX
        xor ch, ch
        potencia 4, cx
        popX
        
        push dx
        xor dx, dx
        mov dl, coef4[1]
        mul dx
        pop dx
        
        pushX
        xor dx, dx
        mov cx, 500
        div cx
        popX
        
        sub dx, ax 
        jmp coefficient3
    minus4: 
    
        pushX
        xor ch, ch
        potencia 4, cx
        popX
        
        push dx
        xor dx, dx
        mov dl, coef4[1]
        mul dx
        pop dx
        
        push cx
        mov cx, 500
        div cx
        pop cx
        
        add dx, ax 
    coefficient3:
        cmp coef3[0],45
        je minus3
        
        pushX
        xor ch, ch
        potencia 3, cx
        popX
        
        push dx
        xor dx, dx
        mov dl, coef3[1]
        mul dx
        pop dx
        
        pushX
        xor dx, dx
        mov cx, 500
        div cx
        popX
        
        sub dx, ax 
        jmp coefficient2
        minus3: 
        
        pushX
        xor ch, ch
        potencia 3, cx
        popX
        
        push dx
        xor dx, dx
        mov dl, coef3[1]
        mul dx
        pop dx
        
        push cx
        mov cx, 500
        div cx
        pop cx
        
        add dx, ax 
    coefficient2:
        cmp coef2[0],45
        je minus2
        
        pushX
        xor ch, ch
        potencia 2, cx
        popX
        
        push dx
        xor dx, dx
        mov dl, coef2[1]
        mul dx
        pop dx
        
        pushX
        xor dx, dx
        mov cx, 500
        div cx
        popX
        
        sub dx, ax 
        jmp coefficient1
        minus2: 
        
        pushX
        xor ch, ch
        potencia 2, cx
        popX
        
        push dx
        xor dx, dx
        mov dl, coef2[1]
        mul dx
        pop dx
        
        push cx
        mov cx, 500
        div cx
        pop cx
        
        add dx, ax 
    coefficient1:
        cmp coef1[0],45
        je minus1
        
        pushX
        xor ch, ch
        potencia 1, cx
        popX
        
        push dx
        xor dx, dx
        mov dl, coef1[1]
        mul dx
        pop dx
        
        pushX
        xor dx, dx
        mov cx, 500
        div cx
        popX
        
        sub dx, ax 
        jmp coefficient0
        minus1: 
        
        pushX
        xor ch, ch
        potencia 3, cx
        popX
        
        push dx
        xor dx, dx
        mov dl, coef1[1]
        mul dx
        pop dx
        
        push cx
        mov cx, 500
        div cx
        pop cx
        
        add dx, ax 
    coefficient0:
        cmp coef0[0], 45
        je minus
        push cx
            xor ch, ch
            mov cl, coef0[1]
            sub dx, cx
        pop cx
        jmp fin
        minus:
        push cx
            xor ch, ch
            mov cl, coef0[1]
            add dx, cx
        pop cx
    fin:

endm

tercerGrado macro var3, var2, var1, var0
    LOCAL while, is_negative, is_positive, continue, finish
    xor ax, ax
    xor bx, bx          
    xor cx, cx          
    mov cl, inicio[1]   
    mov ch, final[1]

    while:
        xor ax, ax
        mov bl, 160         ;x
        mov dl, 100      
        
        test cl,cl    
        js is_negative
        jmp is_positive
        
        is_negative:
            neg cl
            sub bl, cl      ;where x start
            ;y
            gradoX3 0, var3, var2, var1, var0
            neg cl
            jmp continue
        is_positive:
            mul cl
            add bl, cl
            gradoX3 1, var3, var2, var1, var0
            
        continue:
            ;Draw
            dibujarPixel bx, dx, 0ch
            inc cl
            cmp cl, ch
            jg finish
            jmp while 
    finish:
endm

gradoX3 macro signo, var3, var2, var1, var0
LOCAL fin, positive, negative, minus3,coefficient2, minus31, minus32, minus2, minus1, minus, coefficient1, coefficient0
    cmp cl, 30 
    jg fin

    push cx
    mov ch, signo
    cmp ch, 0
    je negative


    pop cx

    cmp var3[0],45
    je minus31
    
    pushX
    xor ch, ch
    potencia 3, cx
    popX
    
    push dx
    xor dx, dx
    mov dl, var3[1]
    mul dx
    pop dx
    
    pushX
    xor dx, dx
    mov cx, 500
    div cx
    popX
    
    sub dx, ax 
    jmp coefficient2
    minus31: 
    
    pushX
    xor ch, ch
    potencia 3, cx
    popX
    
    push dx
    xor dx, dx
    mov dl, var3[1]
    mul dx
    pop dx
    
    push cx
    mov cx, 500
    div cx
    pop cx
    
    add dx, ax 
    jmp coefficient2
    
    negative:
    pop cx

    cmp var3[0],45
    je minus32
    
    pushX
    xor ch, ch
    potencia 3, cx
    popX
    
    push dx
    xor dx, dx
    mov dl, var3[1]
    mul dx
    pop dx
    
    pushX
    xor dx, dx
    mov cx, 500
    div cx
    popX
    
    add dx, ax 
    jmp coefficient2
    minus32: 
    
    pushX
    xor ch, ch
    potencia 3, cx
    popX
    
    push dx
    xor dx, dx
    mov dl, var3[1]
    mul dx
    pop dx
    
    push cx
    mov cx, 500
    div cx
    pop cx
    
    sub dx, ax 
    coefficient2:
        cmp var2[0],45
        je minus2
        
        pushX
        xor ch, ch
        potencia 2, cx
        popX
        
        push dx
        xor dx, dx
        mov dl, var2[1]
        mul dx
        pop dx
        
        pushX
        xor dx, dx
        mov cx, 500
        div cx
        popX
        
        sub dx, ax 
        jmp coefficient1
        minus2: 
        
        pushX
        xor ch, ch
        potencia 2, cx
        popX
        
        push dx
        xor dx, dx
        mov dl, var2[1]
        mul dx
        pop dx
        
        push cx
        mov cx, 500
        div cx
        pop cx
        
        add dx, ax 
    coefficient1:
        cmp var1[0],45
        je minus1
        
        pushX
        xor ch, ch
        potencia 1, cx
        popX
        
        push dx
        xor dx, dx
        mov dl, var1[1]
        mul dx
        pop dx
        
        pushX
        xor dx, dx
        mov cx, 500
        div cx
        popX
        
        sub dx, ax 
        jmp coefficient0
        minus1: 
        
        pushX
        xor ch, ch
        potencia 3, cx
        popX
        
        push dx
        xor dx, dx
        mov dl, var1[1]
        mul dx
        pop dx
        
        push cx
        mov cx, 500
        div cx
        pop cx
        
        add dx, ax 
    coefficient0:
        cmp var0[0], 45
        je minus
        push cx
            xor ch, ch
            mov cl, var0[1]
            sub dx, cx
        pop cx
        jmp fin
        minus:
        push cx
            xor ch, ch
            mov cl, var0[1]
            add dx, cx
        pop cx


    fin:
endm

Cuadratica macro var2, var1, var0
LOCAL while, finish, is_negative, is_positive, continue
    xor ax, ax
    xor bx, bx          
    xor cx, cx         
    mov cl, inicio[1]   
    mov ch, final[1]

    while:
        xor ax, ax
        mov bl, 160         ;x
        mov dl, 100        
        
        test cl,cl    
        js is_negative
        jmp is_positive
        is_negative:
            neg cl
            sub bl, cl  
            gradoX2 var2, var1, var0
            neg cl
            jmp continue
        is_positive:
            mul cl
            add bl, cl
            gradoX2 var2, var1, var0
        continue:
            ;Draw
            dibujarPixel bx, dx, 0ch
            inc cl
            cmp cl, ch
            jg finish
            jmp while 
    finish:
endm

gradoX2 macro var2, var1, var0
LOCAL minus2, minus1, continue, minus0, fin, coefficient1, coefficient0
    cmp cl, 80
    jg fin
    
    cmp var2[0],45
    je minus2
    
    pushX 
    xor ch, ch
    potencia 2, cx
    popX
    
    push dx 
    xor dx, dx
    mov dl, var2[1]
    mul dx
    pop dx
    
    pushX
    xor dx, dx
    mov cx, 500
    div cx
    popX
    
    sub dx, ax
    jmp coefficient1
    
    minus2:
    
        pushX 
        xor ch, ch
        potencia 2, cx
        popX
        
        push dx 
        xor dx, dx
        mov dl, var2[1]
        mul dx
        pop dx
        
        pushX
        xor dx, dx
        mov cx, 500
        div cx
        popX
        
        add dx, ax
    coefficient1:
        xor ax, ax
        cmp var1[0],45
        je minus1
        
        pushX 
        xor ch, ch
        potencia 1, cx
        popX
        
        push dx 
        xor dx, dx
        mov dl, var1[1]
        mul dx
        pop dx
        
        pushX
        xor dx, dx
        mov cx, 500
        div cx
        popX
        
        sub dx, ax
        jmp coefficient0
    minus1:
    
        pushX 
        xor ch, ch
        potencia 1, cx
        popX
        
        push dx 
        xor dx, dx
        mov dl, var1[1]
        mul dx
        pop dx
        
        pushX
        xor dx, dx
        mov cx, 500
        div cx
        popX
        
        add dx, ax
    coefficient0:
    
    cmp var0[0],45
    je minus0
    push cx
        xor ch, ch
        mov cl, var0[1]
        sub dx, cx
    pop cx
    jmp fin
    minus0:
    push cx
        xor ch, ch
        mov cl, var0[1]
        add dx, cx
    pop cx
    fin:

endm

Lineal macro var1, var0
LOCAL while, finish, is_negative, is_positive, continue, plusN, plusP, minusN, minusP
   xor ax, ax
    xor bx, bx          
    xor cx, cx          
    mov cl, inicio[1]   
    mov ch, final[1]
    mov dl, 100        
    mov bl, 160        
    
    while:
        mov al, coef1[1]      
        mov dl, 100
        mov bl, 160 
        ;checkSign
        test cl, cl     
        js is_negative
        jmp is_positive
        is_negative:
            neg cl
            sub bl, cl      
            mul cl
            neg cl
            add dl, al
            
            cmp coef0[0],43
            je plusN
            jmp minusN
            plusN:
                sub dl,coef0[1]
                jmp continue
            minusN:
                add dl, coef0[1]
                jmp continue
        is_positive:
            mul cl
            sub dl, al
            add bl, cl
            cmp coef0[0],43
            je plusP
            jmp minusP
            plusP:
                sub dl, coef0[1]
                jmp continue
            minusP:
                add dl, coef0[1]
        continue:
            inc cl
            xor dh, dh
            dibujarPixel bx, dx, 0ch
            cmp cl, ch
            jne while 
            jmp finish
    finish:

endm

Constante macro var0
LOCAL while, temp, finish, plus, minus, continue
    xor bx, bx
    xor cx, cx   
    mov cl, inicio[1]
    mov ch, final[1]
    mov bl, 160     
    mov dl, 100     
    cmp var0[0], 43
    je plus 
    jmp minus

    plus: 
        sub dl, var0[1]
        jmp continue
    minus:
        add dl, var0[1]
    continue:
        cmp inicio[0],45
        je temp
        add bl, inicio[1]
    
    while:
        inc cl
        xor dh, dh
        dibujarPixel bx, dx, 0ch
        inc bl
        cmp cl, ch
        jne while 
        jmp finish
    temp:
        neg cl
        sub bl, cl
        neg cl
        jmp while
    finish:
endm

dibujarIntervalo macro
LOCAL while, temp, finish
    xor bx, bx          
    xor cx, cx          ;cl = incio  | ch = final
    mov cl, inicio[1]
    mov ch, final[1]
    mov bl, 160         ;Punto de inicio
    cmp inicio[0],45
    je temp
    add bl, inicio[1]
     
    while:
    inc cl
    dibujarPixel bx, 100, 0ch
    inc bl
    cmp cl, ch
    jne while 
    jmp finish
    temp:
        neg cl
        sub bl, cl
        neg cl
        jmp while
    finish:
endm
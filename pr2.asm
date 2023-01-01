include macro.asm
.model small

.stack

.data
;encabezado programa
	encabezado db 10,13,7,"Arquitectura de Computadoras y Ensambladores 1",10,"Proyecto 2",10,"Nombre: Allen Roman",10,"Carnet: 202004745",10,'$'
;mensajes del menu
	msg1 db 10,13,7,"--Menu Calculadora Grafica--","$"
	msg2 db 10,13,7,"1. Ingresar Ecuacion (Funcion).","$"
	msg3 db 10,13,7,"2. Imprimir la funcion almacenada.","$"
	msg4 db 10,13,7,"3. Imprimir la derivda.","$"
	msg5 db 10,13,7,"4. Imprimir la integral.","$"
	msg6 db 10,13,7,"5. Graficar la funcion original, derivada o integral.","$"
	msg7 db 10,13,7,"6. Encontrar los ceros de la funcion por medio del metodo de Newton.","$"
	msg8 db 10,13,7,"7. Encontrar los ceros de la funcion por medio del metodo de Steffensen.","$"
	msg9 db 10,13,7,"8. Salir","$"
	salto db 10,13,"$"
	error db 10,13,7,"Error: Opcion no valida, intente de nuevo","$"
	errorEntero db 10,13,7,"Error: Ingrese un valor entero, intente de nuevo","$"
	memoriaVacia db 10,13,7,"Error: No hay ninguna funcion almacenada, intente de nuevo","$"

;titulos de los submenus
	menuIngresar db 10,13,7,"--Menu Ingresar Ecuacion--","$"
	menuImprimirFuncion db 10,13,7,"--Menu Imprimir Funcion--","$"
	menuImprimirDerivada db 10,13,7,"--Menu Imprimir Derivada--","$"
	menuImprimirIntegral db 10,13,7,"--Menu Imprimir Integral--","$"
	menuGraficar db 10,13,7,"--Menu Graficar--","$"
	menuCerosNewton db 10,13,7,"--Menu Ceros Newton--","$"
	menuCerosSteffensen db 10,13,7,"--Menu Ceros Steffensen--","$"
	adios db 10,13,7,"Adios, tenga un buen dia.","$"

;ingresarFuncion
	stringQuinta db 10,13,7,"Ingrese el coeficiente de grado 5 (x^5): ","$"
	stringCuarta db 10,13,7,"Ingrese el coeficiente de grado 4 (x^4): ","$"
	stringTercera db 10,13,7,"Ingrese el coeficiente de grado 3 (x^3): ","$"
	stringSegunda db 10,13,7,"Ingrese el coeficiente de grado 2 (x^2): ","$"
	stringPrimera db 10,13,7,"Ingrese el coeficiente de grado 1 (x^1): ","$"
	stringConstante db 10,13,7,"Ingrese el coeficiente de grado 0 (Constante): ","$"

;variables varias
stringDerivaFuncion db 10,13,7,"--Derivada de la funcion--","$"
stringIntegralFuncion db 10,13,7,"--Integral de la funcion--","$"
funcionOriginalString db 10,13,7,"f(x) =","$"
derivadaString db 10,13,7,"f'(x) =","$"
integralString db 10,13,7,"F(x) =","$"
menos db "-","$"
mas db "+","$"
multiplicacion db "*","$"
division db "/","$"
seis db "6","$"
cinco db "5","$"
cuatro db "4","$"
tres db "3","$"
dos db "2","$"
x6 db "x^6","$"
x5 db "x^5","$"
x4 db "x^4","$"
x3 db "x^3","$"
x2 db "x^2","$"
x db "x","$"
espacio db " ","$"
constanteIntegracion db " + C","$"
auxiliar        db 3 dup ('0'),'$'
;variables menu graficar
stringFuncion db "1. Funcion Original","$"
stringDerivada db "2. Derivada","$"
stringIntegral db "3. Integral","$"
stringSalir db "4. Salir","$"
stringInicio db "Ingrese el valor inicial del intervalo: ","$"
stringFinal db "Ingrese el valor final del intervalo: ","$"
inicio db 5 dup('$')
final db 5 dup('$')
;variables Newton y Steffensen
stringIteraciones db "Ingrese el numero de iteraciones: ","$"
stringToleranciaC db "Ingrese el coeficiente de tolerancia: ","$"
stringLimiteSup db "Ingrese el limite superior: ","$"
stringLimiteInf db "Ingrese el limite inferior: ","$"
stringTolerancia db "Seleccione el grado de la tolerancia (Ingrese un valor entero positivo):","$"
iteraciones db 5 dup('$')
toleranciaC db 5 dup('$')
limiteSup db 5 dup('$')
limiteInf db 5 dup('$')
tolerancia db 5 dup('$')

;variables coeficientes de la funcion principal, deriva e integral
	coef5 db 5 dup('$')
	coef4 db 5 dup('$')
	coef3 db 5 dup('$')
	coef2 db 5 dup('$')
	coef1 db 5 dup('$')
	coef0 db 5 dup('$')

	coefDerivada4 db 5 dup('$')
	coefDerivada3 db 5 dup('$')
	coefDerivada2 db 5 dup('$')
	coefDerivada1 db 5 dup('$')
	coefDerivada0 db 5 dup('$')

	coefIntegral6 db 5 dup('$')
	coefIntegral5 db 5 dup('$')
	coefIntegral4 db 5 dup('$')
	coefIntegral3 db 5 dup('$')
	coefIntegral2 db 5 dup('$')
	coefIntegral1 db 5 dup('$')

	numero db 2 dup(0)
.code

    ; procedimiento principal main
	main PROC

        ; carga en memoria las variables del semento de datos
    	MOV ax, @data
    	MOV ds, ax
		xor ax,ax
		
		limpiarPantalla ;limpia la pantalla
		imprimir encabezado ;imprime el encabezado del programa

        menuPrincipal: ;etiqueta menu principal
				;imprime el menu del programa
			imprimir msg1
			imprimir msg2
			imprimir msg3
			imprimir msg4
			imprimir msg5
			imprimir msg6
			imprimir msg7
			imprimir msg8
			imprimir msg9
			imprimir salto
			obtenerOpcion ;obtiene la opcion del menu
			cmp al,'1' ;compara la opcion con 1
			je ingresarEcuacion ;si es 1, ingresa a la funcion ingresarEcuacion
			cmp al,'2' ;compara la opcion con 2
			je imprimirFuncion ;si es 2, ingresa a la funcion imprimirFuncion
			cmp al,'3' ;compara la opcion con 3
			je imprimirDerivada ;si es 3, ingresa a la funcion imprimirDerivada
			cmp al,'4' ;compara la opcion con 4
			je imprimirIntegral ;si es 4, ingresa a la funcion imprimirIntegral
			cmp al,'5' ;compara la opcion con 5
			je graficar ;si es 5, ingresa a la funcion graficar
			cmp al,'6' ;compara la opcion con 6
			je cerosNewton ;si es 6, ingresa a la funcion cerosNewton
			cmp al,'7' ;compara la opcion con 7
			je cerosSteffensen ;si es 7, ingresa a la funcion cerosSteffensen
			cmp al,'8' ;compara la opcion con 8
			je salir ;si es 8, ingresa a la funcion salir
			;limpiarPantalla ;limpia la pantalla
			imprimir error ;si no es ninguna de las anteriores, imprime error
			imprimir salto ;imprime salto de linea
			jmp menuPrincipal ;si no es ninguna de las anteriores, vuelve al menu principal
		ingresarEcuacion:
			;ingresa a la funcion ingresarEcuacion
			limpiarPantalla ;limpia la pantalla
			imprimir menuIngresar
			imprimir salto
			ingresoFuncionOriginal ;obtiene los coeficientes de la ecuacion
			jmp menuPrincipal ;vuelve al menu principal
		imprimirFuncion:
			;ingresa a la funcion imprimirFuncion
			limpiarPantalla ;limpia la pantalla
			imprimir menuImprimirFuncion
			imprimir salto
			cmp coef5 [1],'$' ;compara el primer digito del coeficiente 5 con 0
			je FF4 ;si es 0, ingresa a la funcion mmVacia
			jmp mmLlena; si no es 0, ingresa a la funcion mmLlena
			FF4:
			cmp coef4 [1],'$' ;compara el primer digito del coeficiente 4 con 0
			je FF3 ;si es 0, ingresa a la funcion mmVacia
			jmp mmLlena; si no es 0, ingresa a la funcion mmLlena
			FF3:
			cmp coef3 [1],'$' ;compara el primer digito del coeficiente 3 con 0
			je FF2 ;si es 0, ingresa a la funcion mmVacia
			jmp mmLlena; si no es 0, ingresa a la funcion mmLlena
			FF2:
			cmp coef2 [1],'$' ;compara el primer digito del coeficiente 2 con 0
			je FF1 ;si es 0, ingresa a la funcion mmVacia
			jmp mmLlena; si no es 0, ingresa a la funcion mmLlena
			FF1:
			cmp coef1 [1],'$' ;compara el primer digito del coeficiente 1 con 0
			je mmVacia ;si es 0, ingresa a la funcion mmVacia
			jmp mmLlena; si no es 0, ingresa a la funcion mmLlena
			
			mmLlena:
				funcionMemoria ;imprime la funcion en memoria
				jmp menuPrincipal ;vuelve al menu principal
			mmVacia:
				imprimir memoriaVacia ;si es 0, imprime memoria vacia
				imprimir salto
				jmp menuPrincipal ;vuelve al menu principal

		imprimirDerivada:
			;ingresa a la funcion imprimirDerivada
			limpiarPantalla ;limpia la pantalla
			imprimir menuImprimirDerivada
			imprimir salto
			
			cmp coef5 [1],'$' ;compara el primer digito del coeficiente 5 con 0
			je FD4 ;si es 0, ingresa a la funcion mmVacia
			jmp mmLlenaD; si no es 0, ingresa a la funcion mmLlena
			FD4:
			cmp coef4 [1],'$' ;compara el primer digito del coeficiente 4 con 0
			je FD3 ;si es 0, ingresa a la funcion mmVacia
			jmp mmLlenaD; si no es 0, ingresa a la funcion mmLlena
			FD3:
			cmp coef3 [1],'$' ;compara el primer digito del coeficiente 3 con 0
			je FD2 ;si es 0, ingresa a la funcion mmVacia
			jmp mmLlenaD; si no es 0, ingresa a la funcion mmLlena
			FD2:
			cmp coef2 [1],'$' ;compara el primer digito del coeficiente 2 con 0
			je FD1 ;si es 0, ingresa a la funcion mmVacia
			jmp mmLlenaD; si no es 0, ingresa a la funcion mmLlena
			FD1:
			cmp coef1 [1],'$' ;compara el primer digito del coeficiente 1 con 0
			je mmVaciaD ;si es 0, ingresa a la funcion mmVacia
			jmp mmLlenaD; si no es 0, ingresa a la funcion mmLlena
			
			mmLlenaD:
				funcionDerivada ;imprime la funcion en memoria
				imprimir salto;imprime salto de linea
				jmp menuPrincipal ;vuelve al menu principal
			mmVaciaD:
				imprimir memoriaVacia ;si es 0, imprime memoria vacia
				imprimir salto
				jmp menuPrincipal ;vuelve al menu principal


		imprimirIntegral:
			;ingresa a la funcion imprimirIntegral
			limpiarPantalla ;limpia la pantalla
			imprimir menuImprimirIntegral
			imprimir salto
			
			cmp coef5 [1],'$' ;compara el primer digito del coeficiente 5 con 0
			je FI4 ;si es 0, ingresa a la funcion mmVacia
			jmp mmLlenaI; si no es 0, ingresa a la funcion mmLlena
			FI4:
			cmp coef4 [1],'$' ;compara el primer digito del coeficiente 4 con 0
			je FI3 ;si es 0, ingresa a la funcion mmVacia
			jmp mmLlenaI; si no es 0, ingresa a la funcion mmLlena
			FI3:
			cmp coef3 [1],'$' ;compara el primer digito del coeficiente 3 con 0
			je FI2 ;si es 0, ingresa a la funcion mmVacia
			jmp mmLlenaI; si no es 0, ingresa a la funcion mmLlena
			FI2:
			cmp coef2 [1],'$' ;compara el primer digito del coeficiente 2 con 0
			je FI1 ;si es 0, ingresa a la funcion mmVacia
			jmp mmLlenaI; si no es 0, ingresa a la funcion mmLlena
			FI1:
			cmp coef1 [1],'$' ;compara el primer digito del coeficiente 1 con 0
			je mmVaciaI ;si es 0, ingresa a la funcion mmVacia
			jmp mmLlenaI; si no es 0, ingresa a la funcion mmLlena
			
			mmLlenaI:
				funcionIntegral ;imprime la funcion en memoria
				imprimir salto;imprime salto de linea
				jmp menuPrincipal ;vuelve al menu principal
			mmVaciaI:
				imprimir memoriaVacia ;si es 0, imprime memoria vacia
				imprimir salto
				jmp menuPrincipal ;vuelve al menu principal


		graficar:
			;ingresa a la funcion graficar
			limpiarPantalla ;limpia la pantalla
			imprimir menuGraficar
			imprimir salto

			imprimir salto
			
			cmp coef5 [1],'$' ;compara el primer digito del coeficiente 5 con 0
			je G4 ;si es 0, ingresa a la funcion mmVacia
			jmp mmLlenaG; si no es 0, ingresa a la funcion mmLlena
			G4:
			cmp coef4 [1],'$' ;compara el primer digito del coeficiente 4 con 0
			je G3 ;si es 0, ingresa a la funcion mmVacia
			jmp mmLlenaG; si no es 0, ingresa a la funcion mmLlena
			G3:
			cmp coef3 [1],'$' ;compara el primer digito del coeficiente 3 con 0
			je g2 ;si es 0, ingresa a la funcion mmVacia
			jmp mmLlenaG; si no es 0, ingresa a la funcion mmLlena
			G2:
			cmp coef2 [1],'$' ;compara el primer digito del coeficiente 2 con 0
			je G1 ;si es 0, ingresa a la funcion mmVacia
			jmp mmLlenaG; si no es 0, ingresa a la funcion mmLlena
			G1:
			cmp coef1 [1],'$' ;compara el primer digito del coeficiente 1 con 0
			je mmVaciaG ;si es 0, ingresa a la funcion mmVacia
			jmp mmLlenaG; si no es 0, ingresa a la funcion mmLlena

			mmLlenaG:
				imprimir salto; imprime salto de linea
				imprimir stringFuncion ;imprime la string funcion en memoria
				funcionMemoria ;imprime la funcion en memoria
				imprimir salto; imprime salto de linea
				imprimir stringDerivada ;imprime la string derivada en memoria
				funcionDerivada ;imprime la funcion en memoria
				imprimir salto; imprime salto de linea
				imprimir stringIntegral ;imprime la string integral en memoria
				funcionIntegral ;imprime la funcion en memoria
				imprimir salto; imprime salto de linea
				imprimir stringSalir ;imprime la string salir en memoria
				imprimir salto;imprime salto de linea
				obtenerOpcion ;obtiene la opcion del usuario
				cmp al, '1'
				je graficaFuncion
				cmp al, '2'
				je graficaDerivada
				cmp al, '3'
				je graficaIntegral
				cmp al, '4'
				je menuPrincipal
				imprimir error
				jmp graficar
			mmVaciaG:
				imprimir memoriaVacia ;si es 0, imprime memoria vacia
				imprimir salto
				jmp menuPrincipal ;vuelve al menu principal
			



		cerosNewton:
			;ingresa a la funcion cerosNewton
			limpiarPantalla ;limpia la pantalla
			imprimir menuCerosNewton
			imprimir salto
			imprimir stringIteraciones ;imprime la string iteraciones en memoria
			leer iteraciones ;lee las iteraciones
			imprimir stringToleranciaC
			leer toleranciaC
			imprimir stringLimiteSup
			leer limiteSup
			imprimir stringLimiteInf
			leer limiteInf
			imprimir stringTolerancia
			leer tolerancia
			imprimir salto
			jmp menuPrincipal ;vuelve al menu principal
		cerosSteffensen:
			;ingresa a la funcion cerosSteffensen
			limpiarPantalla ;limpia la pantalla
			imprimir menuCerosSteffensen
			imprimir salto
			imprimir stringIteraciones ;imprime la string iteraciones en memoria
			leer iteraciones ;lee las iteraciones
			imprimir stringToleranciaC
			leer toleranciaC
			imprimir stringLimiteSup
			leer limiteSup
			imprimir stringLimiteInf
			leer limiteInf
			imprimir stringTolerancia
			leer tolerancia
			imprimir salto
			jmp menuPrincipal ;vuelve al menu principal
		salir:
			limpiarPantalla ;limpia la pantalla
			imprimir adios ;imprime adios
			imprimir salto ;imprime salto de linea
			mov ah, 4ch
        	int 21h
		errorEntradaFuncion:
			limpiarPantalla ;limpia la pantalla
			imprimir errorEntero
			LimpiarVariables coef5, SIZEOF coef5, 24h
			LimpiarVariables coef4, SIZEOF coef4, 24h
			LimpiarVariables coef3, SIZEOF coef3, 24h
			LimpiarVariables coef2, SIZEOF coef2, 24h
			LimpiarVariables coef1, SIZEOF coef1, 24h
			LimpiarVariables coef0, SIZEOF coef0, 24h
			jmp menuPrincipal
		graficaFuncion:
			limpiarPantalla ;limpia la pantalla
			obtenerRangoGrafico
			graficarFuncionOriginal
			imprimir salto
			jmp graficar 
		graficaDerivada:
			limpiarPantalla ;limpia la pantalla
			obtenerRangoGrafico
			graficarDerivada
			imprimir salto
			jmp graficar
		graficaIntegral:
			limpiarPantalla ;limpia la pantalla
			obtenerRangoGrafico
			graficarIntegral
			imprimir salto
			jmp graficar

	main ENDP 
end main
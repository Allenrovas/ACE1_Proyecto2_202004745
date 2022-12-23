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
	stringQuinta db 10,13,7,"Ingrese el coeficiente de grado 5: ","$"
	stringCuarta db 10,13,7,"Ingrese el coeficiente de grado 4: ","$"
	stringTercera db 10,13,7,"Ingrese el coeficiente de grado 3: ","$"
	stringSegunda db 10,13,7,"Ingrese el coeficiente de grado 2: ","$"
	stringPrimera db 10,13,7,"Ingrese el coeficiente de grado 1: ","$"
	stringConstante db 10,13,7,"Ingrese el coeficiente de grado 0: ","$"

;variables coef
	coef5 db 5 dup('$')
	coef4 db 5 dup('$')
	coef3 db 5 dup('$')
	coef2 db 5 dup('$')
	coef1 db 5 dup('$')
	coef0 db 5 dup('$')

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
			limpiarPantalla ;limpia la pantalla
			imprimir error ;si no es ninguna de las anteriores, imprime error
			imprimir salto ;imprime salto de linea
			jmp menuPrincipal ;si no es ninguna de las anteriores, vuelve al menu principal
		ingresarEcuacion:
			;ingresa a la funcion ingresarEcuacion
			limpiarPantalla ;limpia la pantalla
			imprimir menuIngresar
			imprimir salto
			obtenerCoeficientes ;obtiene los coeficientes de la ecuacion
			jmp menuPrincipal ;vuelve al menu principal
		imprimirFuncion:
			;ingresa a la funcion imprimirFuncion
			limpiarPantalla ;limpia la pantalla
			imprimir menuImprimirFuncion
			imprimir salto
			jmp menuPrincipal ;vuelve al menu principal
		imprimirDerivada:
			;ingresa a la funcion imprimirDerivada
			limpiarPantalla ;limpia la pantalla
			imprimir menuImprimirDerivada
			imprimir salto
			jmp menuPrincipal ;vuelve al menu principal
		imprimirIntegral:
			;ingresa a la funcion imprimirIntegral
			limpiarPantalla ;limpia la pantalla
			imprimir menuImprimirIntegral
			imprimir salto
			jmp menuPrincipal ;vuelve al menu principal
		graficar:
			;ingresa a la funcion graficar
			limpiarPantalla ;limpia la pantalla
			imprimir menuGraficar
			imprimir salto
			jmp menuPrincipal ;vuelve al menu principal
		cerosNewton:
			;ingresa a la funcion cerosNewton
			limpiarPantalla ;limpia la pantalla
			imprimir menuCerosNewton
			imprimir salto
			jmp menuPrincipal ;vuelve al menu principal
		cerosSteffensen:
			;ingresa a la funcion cerosSteffensen
			limpiarPantalla ;limpia la pantalla
			imprimir menuCerosSteffensen
			imprimir salto
			jmp menuPrincipal ;vuelve al menu principal
		salir:
			limpiarPantalla ;limpia la pantalla
			imprimir adios ;imprime adios
			imprimir salto ;imprime salto de linea
			mov ah, 4ch
        	int 21h
		

	main ENDP 
end main
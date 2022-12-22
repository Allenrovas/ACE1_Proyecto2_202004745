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
	error db 10,13,7,"Opcion no valida, intente de nuevo","$"




.code

    ; procedimiento principal main
	main PROC

        ; carga en memoria las variables del semento de datos
    	MOV ax, @data
    	MOV ds, ax
		xor ax,ax
		
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
			imprimir error ;si no es ninguna de las anteriores, imprime error
			jmp menuPrincipal ;si no es ninguna de las anteriores, vuelve al menu principal
		ingresarEcuacion:
			;ingresa a la funcion ingresarEcuacion
			imprimir msg2
			jmp menuPrincipal ;vuelve al menu principal
		imprimirFuncion:
			;ingresa a la funcion imprimirFuncion
			imprimir msg3
			jmp menuPrincipal ;vuelve al menu principal
		imprimirDerivada:
			;ingresa a la funcion imprimirDerivada
			imprimir msg4
			jmp menuPrincipal ;vuelve al menu principal
		imprimirIntegral:
			;ingresa a la funcion imprimirIntegral
			imprimir msg5
			jmp menuPrincipal ;vuelve al menu principal
		graficar:
			;ingresa a la funcion graficar
			imprimir msg6
			jmp menuPrincipal ;vuelve al menu principal
		cerosNewton:
			;ingresa a la funcion cerosNewton
			imprimir msg7
			jmp menuPrincipal ;vuelve al menu principal
		cerosSteffensen:
			;ingresa a la funcion cerosSteffensen
			imprimir msg8
			jmp menuPrincipal ;vuelve al menu principal
		salir:
			mov ah, 4ch
        	int 21h
		

	main ENDP 



end main
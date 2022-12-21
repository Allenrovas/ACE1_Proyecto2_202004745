.model small

.stack

.data
header db "UNIVERSIDAD DE SAN CARLOS DE GUATEMALA",13,"FACULTAD DE INGENIERIA",10,"CIENCIAS Y SISTEMAS",10,"ARQUITECTURA DE COMPUTADORAS Y ENSAMBLADORES 1",10,"NOMBRE: Allen Roman",10,"CARNET: 202004745",10,"SECCION: N",10,'$'


.code

    ; procedimiento principal main
	main PROC

        ; carga en memoria las variables del semento de datos
    	MOV ax, @data
    	MOV ds, ax
		xor ax,ax  

        ; impresion por pantalla
		mov dx, offset header
		mov ah, 9
    	int 21h   
    	.exit   

	main ENDP 



end main
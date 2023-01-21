*===============================================================================
* Aprendiendo Stata (C6): Ordenar las variables de una base de datos
* Autor: Manuel V. Montesinos
* El Economista Camuflado
*===============================================================================

    *** Cambia de directorio
    
    cd "escribe la ruta a tu directorio"
    
*-------------------------------------------------------------------------------

    *** Abre la base de datos
    
    use data1.dta, clear

	*** Reordena las observaciones (filas): 'sort' y 'gsort' 
    
    * Orden ascendente (de menor a mayor)
    
	browse id asvab02
	sort asvab02
    sort asvab02 in 1/5
    sort asvab02, stable
	browse id asvab02 asvab03 asvab04
    sort date_birth
	
	* Orden descendente (de mayor a menor)
    
    generate neasvab02 = -asvab02
    sort neasvab02
    
	gsort -asvab02
	browse id asvab02
	gsort -asvab02 -asvab03 -asvab04 id
	browse id asvab02 asvab03 asvab04

	*** Reordena las variables (columnas)
    
	browse
	help order
	order id female age
    order id female age, last
    order age, before(date_birth)
	order age, after(date_birth)
    
    forvalues i = 1/20 {
        generate year`i' = .
    }
    
    order year*, alphabetic
    order year*, alphabetic last
    order year*, sequential
    order year*, sequential last
    
*-------------------------------------------------------------------------------

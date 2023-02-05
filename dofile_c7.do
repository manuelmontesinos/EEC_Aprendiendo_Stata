*===============================================================================
* Aprendiendo Stata (C7): Nombres y etiquetas de variables.
* Autor: Manuel V. Montesinos
* El Economista Camuflado
*===============================================================================

    *** Cambia de directorio
    
    cd "/Users/montesinos/Dropbox/Mac/Documents/Escribiendo_me_divierto/Hablamos/Aprendiendo_Stata/Materiales_Stata"
    
*-------------------------------------------------------------------------------

    ****** Abre la base de datos
    
    use data1.dta, clear
    
*-------------------------------------------------------------------------------

	****** Cambia el nombre de variables
    
	rename hours hours_weekly
	summarize hours_weekly, detail
	
*-------------------------------------------------------------------------------

	****** Etiqueta variables
	
	label variable female "gender"
	
	**** Modifica las etiquetas
    
	label variable s "years of schooling (highest grade completed)"
	
	**** Muestra una lista de las etiquetas existentes en la base de datos
    
	label list
	
	**** Etiqueta valores: asigna la etiqueta "yn" a las variables "ethhisp" y
    **** "ethwhite"
    
	label values ethhisp ethwhite yn
	tabulate ethhisp ethwhite
	
	**** Crea una nueva etiqueta para los valores de "female"
    
	label def sex 0 "male" 1 "female", replace
	label values female sex
	tabulate female 

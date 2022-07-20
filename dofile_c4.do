*===============================================================================
* Aprendiendo Stata (C4): Tablas de frecuencias
* Autor: Manuel V. Montesinos
* El Economista Camuflado
*===============================================================================

    *** Cambia de directorio
    
    cd "escribe la ruta a tu directorio"
    
*-------------------------------------------------------------------------------

    *** Abre la base de datos
    
    use data1.dta, clear
   
	*** Muestra los valores que toma una variable y sus frecuencias (absoluta,
    *** relativa y acumulada)
    
	tabulate female
	tabulate age
	
	*** La tabla de frecuencias no es tan informativa con variables continuas
    
	tabulate earnings
	
	*** Frecuencias conjuntas de dos variable
    
	tabulate female ethhisp
	tabulate female ethhisp, cell	
	tabulate pov78 ethhisp, row	
    tabulate pov78 ethhisp, column
	tabulate pov78 ethhisp, row column cell
	
	*** Cuando trabajamos con tres variables, fijamos el valor de una y 
    *** tabulamos las otras dos
    
	bysort female: tabulate pov78 ethhisp, row column 
	
	*** Comando 'table'
    
	table female
	
	table () (female), statistic(frequency) statistic(mean age s) nototals
	table (pov78) (female), statistic(frequency) statistic(mean s earnings) ///
		statistic(sd s earnings) nototals
	table () (ethhisp), statistic(frequency) statistic(mean s earnings) ///
		statistic(sd s earnings) nototals
	
	/** Cómo obtener el mismo tipo de información en Stata 16 y anteriores:
    
	table female, c(freq mean age mean s)
	table female, c(freq mean s sd s mean earnings sd earnings) by(pov78)
	table ethwhite, c(freq mean s sd s mean earnings sd earnings)
    
	*/
	
	**** Comando 'tabstat'
	tabstat age earnings
	tabstat age earnings, s(count mean median sd var min max range)
    
*-------------------------------------------------------------------------------
    
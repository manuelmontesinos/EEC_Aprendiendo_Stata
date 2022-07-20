*===============================================================================
* Aprendiendo Stata (C3): Estadísticos descriptivos
* Autor: Manuel V. Montesinos
* El Economista Camuflado
*===============================================================================
	
	****** Cambiar el directorio
	
	cd "escribe la ruta a tu directorio"
	
*-------------------------------------------------------------------------------
	
	****** Abrir una base de datos
	
	use data1.dta, clear
	
*-------------------------------------------------------------------------------	
	
	****** Estadísticos descriptivos
	
	summarize
	summarize female ethwhite age pov78 earnings asvab_mean
	summarize age earnings, detail
	summarize asvab_mean, detail
	
*-------------------------------------------------------------------------------

	****** Histogramas
	
	histogram earnings
	histogram asvab_mean
	
*-------------------------------------------------------------------------------

	****** Coeficiente de correlación
	
	correlate s earnings
	correlate s asvab_mean earnings hours age height weight85 weight02
	
	****** Diagrama de dispersión (ingresos vs años de educación)
	twoway (scatter earnings s) (lfit earnings s)
	
	****** Matriz de varianzas y covarianzas
	
	correlate s asvab_mean, covariance
	
*-------------------------------------------------------------------------------

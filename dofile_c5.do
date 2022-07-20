*===============================================================================
* Aprendiendo Stata (C5): Ejercicios para practicar (I)
* Autor: Manuel V. Montesinos
* El Economista Camuflado
*===============================================================================

    *** Cambia de directorio
    
    cd "escribe la ruta a tu directorio"
    
*-------------------------------------------------------------------------------

    *** Abre la base de datos
    
    use data1.dta, clear
    
    *** 1) ¿Qué podemos decir sobre la relación entre el nivel educativo de los 
    *** encuestados y el nivel educativo de sus padres?
    
    correlate s sm sf
    
    *** 2) Calcula la nota media en los tests de aritmética (asvab02), 
    *** vocabulario (asvab03) y comprensión lectora (asvab04) por etnia y género
    
    table (female) (ethnicity), statistic(mean asvab02 asvab03 asvab04) nototals
    table (female) () (ethnicity), statistic(mean asvab02 asvab03 asvab04) nototals
    table (female) (ethnicity), statistic(mean asvab_mean) nototals
    
    table female, c(freq mean asvab02 mean asvab03 mean asvab04) by(ethnicity)
    
    *** 3) Si un individuo vivía bajo el umbral de la pobreza en el año 1978, 
    *** ¿tendrá unos ingresos más bajos en la actualidad?
    
    table (pov78) (), statistic(mean earnings) statistic(sd earnings) nototals

*-------------------------------------------------------------------------------

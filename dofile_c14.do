*===============================================================================
* Aprendiendo Stata (C14): Gráficos en Stata
* Autor: Manuel V. Montesinos
* El Economista Camuflado
*===============================================================================

    ****** Fijar el directorio
    
    cd "escribe la ruta a tu directorio"
    
    ****** Abre un log-file
    
    capture log close
    log using log_c14.smcl, replace
    
    sysuse uslifeexp, clear
    
    ****** Gráfico de líneas
    
    graph twoway line le year
    twoway line le year
    line le year
    
    *** Dos líneas en el mismo gráfico
    
    graph twoway line le_wmale year || line le_bmale year
    graph twoway (line le_wmale year) (line le_bmale year)
    graph twoway (line le_wmale year) (line le_bmale year) ///
        (line le_wfemale year) (line le_bfemale year)
        
    graph twoway line le year if year > 1950
    
*-------------------------------------------------------------------------------

    ****** Gráfico de dispersión
    
    sysuse lifeexp, clear
    
    graph twoway scatter lexp gnppc
    twoway scatter lexp gnppc
    scatter lexp gnppc
    
    *** Dos relaciones entre variables en el mismo gráfico
    
    graph twoway (scatter lexp gnppc) (scatter lexp popgrowth)
    
    generate gnp000 = gnppc/1000
    label variable gnp000 "GNP per capita, thousands of dollars"
    graph twoway (scatter lexp gnp000) (scatter lexp popgrowth)
    
    *** Añadir ejes
    
    graph twoway (scatter lexp gnp000, xaxis(1)) ///
        (scatter lexp popgrowth, xaxis(2))
    
    *** Fitted line 
    
    graph twoway (lfitci lexp gnp000) (scatter lexp gnp000)
    
    *** Generar log GNP
    
    generate ln_gnp = ln(gnppc)
    label variable ln_gnp "log(gnp)"
    graph twoway (lfitci lexp ln_gnp) (scatter lexp ln_gnp)

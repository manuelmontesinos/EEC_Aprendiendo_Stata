*===============================================================================
* Aprendiendo Stata (C16): Macros en Stata
* Autor: Manuel V. Montesinos
* El Economista Camuflado
*===============================================================================

    ****** Fijar el directorio
    
    cd "escribe la ruta a tu directorio"
    
    ****** Abre un log-file
    
    capture log close
    log using log_c16.smcl, replace
    
    ****** Carga la base de datos
    
    use data_schooling_earnings.dta, clear
    
    ** Números
    
    local N 4
    display `N'*3
    
    ** Nombres de variables
    
    local N "newvar"
    generate `N'=female
    
    local N "age"
    generate age2=`N'^2
    
    ** Condicionales
    
    local BlackWoman (ethblack==1 & female==1)
    summarize earnings if `BlackWoman'
    
    ** Varios macros en un mismo comando
    
    capture drop newvar
    local a "newvar"
    local i = 2
    generate `a' = `i'*3
    
    ** Macro global
    
    global N 4
    display $N * 3
    global BlackWoman (ethblack==1 & female==1)
    summarize earnings if $BlackWoman

*------------------------------------------------------------------------------- 
    
    capture log close    

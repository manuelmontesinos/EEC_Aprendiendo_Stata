*===============================================================================
* Aprendiendo Stata (C18): Programas en Stata
* Autor: Manuel V. Montesinos
* El Economista Camuflado
*===============================================================================

    ****** Fijar el directorio
    
    cd "escribe la ruta a tu directorio"
    
    ****** Abre un log-file
    
    capture log close
    log using log_c18.smcl, replace
    
    ****** Carga la base de datos
    
    use data_schooling_earnings.dta, clear
    
    ****** Ejemplo 1
    
    capture program drop firstP
    program firstP
        
        display ""
        display "`1'"
        display ""
        
        tabulate `2' `3', row col 
    
    end
    
    firstP "This is my first program" pov78 divorced
    
    ****** Ejemplo 2
    
    capture program drop secondP
    program secondP
        
        display ""
        display "This is my second program"
        display ""
        
        tabulate ethwhite female
    
    end
    
    secondP
    
    ****** Ejemplo 3
    
    capture program drop power_n
    program power_n
    
        capture drop z 
        
        if `2' > 0 {
            generate z = `1'^`2'
            label variable z "`1'^`2'"
        } 
        else if `2' == 0 {
            generate z = log(`1')
            label variable z "log(`1')"
        }
        else {
            generate z = -`1'
            label variable z "-`1'"
        }
    
    end
    
    power_n age 2
    browse age z
    
    power_n earnings 0
    browse earnings z
    
    power_n hours -5
    browse hours z
    
*------------------------------------------------------------------------------- 
    
    capture log close

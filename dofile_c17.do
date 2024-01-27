*===============================================================================
* Aprendiendo Stata (C17): Loops en Stata
* Autor: Manuel V. Montesinos
* El Economista Camuflado
*===============================================================================

    ****** Fijar el directorio
    
    cd "escribe la ruta a tu directorio"
    
    ****** Abre un log-file
    
    capture log close
    log using log_c17.smcl, replace
    
    ****** Carga la base de datos
    
    use data_schooling_earnings.dta, clear
    
    ****** While loop
    
    local i = 5
    while `i' > 0 {
        display "`i' + 1 = " `i' + 1
        display ""
        local i = `i' - 1
    }
    
    ****** For loop 
    
    **** Forvalues loop 
    
    forvalues i = 1/5 {
        display "`i' + 1 = " `i' + 1
        display ""
    }
    
    ** Dummies
    
    forvalues i = 37/45 {
        generate female_age`i' = (female==1 & age==`i')
        label variable female_age`i' "`i' years old female"
    }
    
    **** Foreach loop 
    
    foreach i in 8 25 37 {
        display "`i' + 1 = " `i' + 1
        display ""
    }
    
    foreach v in asvab02 asvab03 asvab04 asvab05 {
        display ""
        display "`v'"
        regress earnings `v'
        display ""
    }
    
    foreach v in asvab02-asvab05 {
        display ""
        display "`v'"
        regress earnings `v'
        display ""
    }
    
    local myvars "ethblack ethhisp educdo single height"
    foreach v of varlist `myvars' {
        display ""
        display "`v'"
        regress earnings `v'
        display ""
    }
    
    ****** Nested loop
    
    forvalues i = 43/45 {
        forvalues j = 0/1 {
            display "---------------------------"
            display "age == `i' & married == `j'"
            display "---------------------------"
            summarize hours earnings if age == `i' ///
                & married == `j'
            display ""
        }
    }
    
    forvalues i = 43/45 {
        forvalues j = 0/1 {
            display "---------------------------"
            display "age == `i' & married == `j'"
            display "---------------------------"
            if `i' == 45 {
                summarize earnings if age == `i' ///
                    & married == `j'
            }
            else {
                summarize hours earnings if age == `i' ///
                    & married == `j'
            }
            display ""
        }
    }
    
*------------------------------------------------------------------------------- 
    
    capture log close    
*===============================================================================
* Aprendiendo Stata (C12): Cómo combinar bases de datos en Stata
* Autor: Manuel V. Montesinos
* El Economista Camuflado
*===============================================================================

    ****** 'Append' y 'Merge'
    
    clear 
    input famid str4 name inc
        2 "Art" 22000
        1 "Bill" 30000
        3 "Paul" 25000
    end
    save dads.dta, replace
    
    clear 
    input famid str4 name inc
        1 "Bess" 15000
        3 "Pat" 50000
        2 "Amy" 18000
    end
    save moms.dta, replace
    
    clear
    input famid faminc96 faminc97 faminc98
        3 75000 76000 77000
        2 45000 45400 45800
        4 35000 35400 37800
    end
    save faminc.dta, replace
    
    clear
    input famid str4 kidname birth age wt str1 sex
        1 "Beth" 1 9 60 "f"
        2 "Andy" 1 8 40 "m"
        3 "Pete" 1 6 20 "f"
        1 "Bob" 2 6 80 "m"
        1 "Barb" 3 3 50 "m"
        2 "Al" 2 6 20 "f"
        2 "Ann" 3 2 60 "m"
        3 "Pam" 2 4 40 "f"
        3 "Phil" 3 2 20 "m"
    end
    save kids.dta, replace 
    
    use dads.dta, clear
    append using moms.dta
    
    use dads.dta, clear
    merge 1:1 famid using faminc.dta
    
    use kids.dta, clear
    merge m:1 famid using moms.dta
    rename name momname
    drop _merge
    
    merge m:1 famid using dads.dta, keepusing(name)
    rename name dadname
    
    erase moms.dta
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
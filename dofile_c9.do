
    use data1.dta, clear
    
    drop date_birth
    drop ethnicity ethhisp
    drop day_b - year_b
    
    drop if age==37
    
    keep id
    keep id - hours
    
    keep if age==37
    
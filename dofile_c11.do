
    save my_data, replace
    
    clear
    input id str1 name trial1 trial2 trial3
        1 "A" 1.5 1.4 1.6 
		2 "B" 1.5 . 1.9 
		3 "" . 2.0 1.6 
		4 "C" . . 2.2 
		5 "D" 1.9 2.1 2
		6 "" 1.8 2.0 1.9
		7 "F" . .  .
    end
    
    use example.dta, clear
    save example_v2.dta, replace 
    
    clear
    sysuse auto
    sysuse dir
    sysuse dir, all
    
    import excel example.xlsx, sheet("students") firstrow clear
    
    import delimited unemployment_rate.csv, varname(1) delimiter(",") clear
    
    import delimited educ_ilev_1_Data.csv, varname(1) clear
    
    destring value, replace 
    replace value = "" if value == ":"
    destring value, replace ignore(",")
    
    
    
    
    
    
    
    
    
    
    
    
    
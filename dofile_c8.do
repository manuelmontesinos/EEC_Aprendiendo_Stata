
    use data1.dta, clear
    
    tabulate age
    tabulate age if female==1
    tabulate age if female==1 & age>40
    tabulate age if (female==1 & age>40) | (female==0 & age<=40)
    tabulate age if female==1 | age>40
    
    summarize earnings if hours>34, detail
    
    tabstat earnings if hours>=35, by(female)
    
    tabulate age if female!=1
    tabulate age if female==0
    
    
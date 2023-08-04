
    use data1.dta, clear
    
    generate new_var = 1
    
    generate mr_ms = "Mr" if female == 0
    replace mr_ms = "Ms" if female == 1
    generate mr_ms_2 = cond(female==1, "Ms", "Mr")
    
    generate highly_educated = (s > 12)
    label variable highly_educated "13+ years of school"
    tabulate highly_educated
    
    generate log_earnings = log(earnings)
    browse earnings log_earnings
    
    generate Rasvab02 = (asvab02 - 50.69)/9.49
    browse asvab02 Rasvab02
    
    generate mean_asvab304 = (asvab03 + asvab04)/2
    
    generate s_2 = s^2
    
    generate name = "A"
    generate surname = "B"
    generate fullname = name +" "+surname
    
    sort id
    generate new_id = _n
    
    egen avg_earnings = mean(earnings)
    egen med_earnings = median(earnings)
    egen sd_earnings = sd(earnings)
    
    egen mean_asvab_english = rowmean(asvab03 asvab04)
    
    egen avg_earn_sex = mean(earnings), by(female)
    egen avg_earn_sex_age = mean(earnings), by(female age)
    
    ssc install egenmore, replace 
    
    egen sdmean_earnings = semean(earnings)
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
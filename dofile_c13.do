*===============================================================================
* Aprendiendo Stata (C13): Directorios y log-files
* Autor: Manuel V. Montesinos
* El Economista Camuflado
*===============================================================================
    
    pwd 
    
    cd "escribe_tu_directorio"
    
    dir 
    
    mkdir my_directory3
    
    cd ../..
    *cd Materiales_Stata/my_directory3
    
    use "my_directory1/my_directory2/example.dta"
    save "another_directory/another_copy.dta"
    erase "another_directory/another_copy.dta"
       
    ** Log-files
    
    capture log close 
    log using my_first_logfile.log, replace
    display "This is my first logfile"
    log close 
    
    log using my_first_logfile.log, append
    display "let's add a table"
    sysuse auto
    tabulate foreign
    log close 
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
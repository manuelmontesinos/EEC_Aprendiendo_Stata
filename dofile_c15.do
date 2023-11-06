*===============================================================================
* Aprendiendo Stata (C15): Gráficos en Stata (Parte 2)
* Autor: Manuel V. Montesinos
* El Economista Camuflado
*===============================================================================

    ****** Fijar el directorio
    
    cd "escribe la ruta a tu directorio"
    
    ****** Abre un log-file
    
    capture log close
    log using log_c15.smcl, replace
    
    ****** Títulos, leyendas y ejes
    
    sysuse lifeexp, clear
    
    *** Log GNP
    
    generate ln_gnp = ln(gnppc)
    label variable ln_gnp "log(gnp)"
    
    generate gnp000 = gnppc/1000
	label variable gnp000 "GNP per capita, thousands of dollars"
    
    graph twoway (scatter lexp ln_gnp) (lfit lexp ln_gnp), ///
        title("Life expectancy vs. GNP per capita") ///
        subtitle("Europe, Central Asia, North and South America") ///
        note("Data source: World Bank, 1998") ///
        legend(ring(0) pos(5) order(2 "linear fit") col(1))
        
    graph twoway (scatter lexp ln_gnp) (lfit lexp ln_gnp), ///
        title("Life expectancy vs. GNP per capita") ///
        subtitle("Europe, Central Asia, North and South America") ///
        note("Data source: World Bank, 1998") legend(off) ///
        ytitle("Life expectancy at birth (year)") ///
        xtitle("log(GNP) per capita") ylabel(50(10)90) 
        
    graph twoway (scatter lexp gnp000) (lfit lexp gnp000), ///
        title("Life expectancy vs. GNP per capita") ///
        subtitle("Europe, Central Asia, North and South America") ///
        note("Data source: World Bank, 1998") legend(off) ///
        ytitle("Life expectancy at birth (year)") ///
        xtitle("log(GNP) per capita") ylabel(50(10)90) ///
        xlabel(.5 5 10 15 20 25 30, grid) xsca(log)
        
    ****** Estilos de líneas
    
    sysuse uslifeexp, clear
    
    graph twoway (line le_wmale year) (line le_bmale year)
    
    graph twoway ///
        (line le_wmale year, lcolor(blue) lwidth(medium) lpattern(solid)) ///
        (line le_bmale year, lcolor(red) lwidth(medium) lpattern(dash)), ///
        title("U.S. Life Expectancy") subtitle("Males") ///
        legend(order(1 "white" 2 "black") ring(0) pos(5))
        
    ****** Gestionar gráficos
    
    graph twoway line le_wmale year, lcolor(blue) lwidth(medium) ///
        lpattern(solid) saving(wmale, replace)
        
    graph use wmale.gph
    graph export wmale.png, replace 
    graph export wmale.eps, replace 
    
    ****** Combinar gráficos
    
    graph twoway line le_bmale year, lcolor(red) lwidth(medium) ///
        lpattern(dash) saving(bmale, replace)
        
    graph combine wmale.gph bmale.gph, ///
        title("US Life Expectancy") subtitle("Males") ycommon 
        
    ****** Histogramas
    
    webuse womenwage, clear
    
    generate lwage = log(wage)
    
    histogram lwage, bin(10) title("Wages of women") xtitle("log(wage)") ///
        normal frequency addlabels
        
    ****** Kernels
    
    kdensity lwage
    kdensity lwage, bwidth(5)
    kdensity lwage, bwidth(0.1)
    
    histogram lwage, bin(10) kdensity frequency title("Wages of women") ///
        xtitle("log(wage)")
    
*------------------------------------------------------------------------------- 
    
    capture log close

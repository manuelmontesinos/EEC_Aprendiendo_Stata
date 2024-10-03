*===============================================================================
* Resolviendo Problemas en Stata: Extraer Información de Variables String
* Autor: Manuel V. Montesinos
* El Economista Camuflado
*===============================================================================

** Crear una muestra de datos ficticios

clear
input str4 worktime
    "3630"
    "0845"
    "1200"
    "0955"
    "2305"
    "4440"
    "5125"
    "9999"
end

** Ver los datos originales
list

** 1) Verificar la longitud de la variable worktime (debe ser 4 caracteres)

generate length_worktime = strlen(worktime)
list worktime length_worktime 

** Rellenar con ceros a la izquierda si es necesario

replace worktime = substr("0000", 1, 4 - strlen(worktime)) ///
    + worktime if strlen(worktime) < 4
    
** 2) Crear variables para las horas y minutos

generate hours = real(substr(worktime, 1, 2))
generate minutes = real(substr(worktime, 3, 2))  

** Verificar el resultado

list worktime hours minutes

** 3) (Opcional) Covertir a horas totales en formato decimal

generate total_hours = hours + minutes/60
list worktime hours minutes total_hours

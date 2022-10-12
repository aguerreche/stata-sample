clear
capture log close
cd "C:\Users\iniak\Downloads\Stata14\Stata14\Tp capital humano"
use "EPH1T.dta", clear

log using "loop.log",replace

codebook ch06
rename ch06 edad
  label var edad "Edad"
  
 codebook ch04
 rename ch04 sexo
   label var sexo "Sexo"
   
 codebook nivel_ed
 rename nivel_ed educacion
 label var educacion "Educacion"
 desc educacion
 drop if missing(educacion)
 gen yearseduc=.
   replace yearseduc=0 if educacion==7
   replace yearseduc=5 if educacion==1
   replace yearseduc=7 if educacion==2
   replace yearseduc=10 if educacion==3
   replace yearseduc=12 if educacion==4
   replace yearseduc=13 if educacion==5
   replace yearseduc=17 if educacion==6
 gen explaboral=edad-yearseduc-6
 
 
 gen l_ing = ln(p21)
 replace l_ing=. if estado>2 & estado!=0
 label var l_ing "Logaritmo Ingreso Laboral"
 
 summ l_ing
 
 
 regress l_ing explaboral
 
 

*-------------------------------------------------------------------------------
* Cleaning and Appending Access Data
* ------------------------------------------------------------------------------

* Setting Env Variables
global directory: env HealthAccessDirectory

* Setting Directory
cd "$directory"

*-------------------------------------------------------------------------------
* Total Nursing homes per State 
* ------------------------------------------------------------------------------
global category "prvdr_ctgry_cd == 2 | prvdr_ctgry_cd == 3 | prvdr_ctgry_cd == 4 | prvdr_ctgry_cd == 10 "

forvalues i = 1991/2020 {

use pos`i'.dta
gen Q_NursingHomes = 1
destring prvdr_ctgry_cd, replace
destring ssa_state_cd, replace
keep if $category
collapse (sum) Q_NursingHomes, by(ssa_state_cd)
gen year= `i'

save POS_Hospitals_`i', replace
}

clear
forvalues i = 1984/1990 {

use pos`i'.dta
gen Q_NursingHomes = 1
rename state ssa_state_cd
rename category prvdr_ctgry_cd
destring prvdr_ctgry_cd, replace
destring ssa_state_cd, replace

keep if $category
collapse (sum) Q_NursingHomes, by(ssa_state_cd)
gen year= `i'

save POS_Hospitals_`i', replace
}

clear
use POS_Hospitals_1984.dta
forvalues i = 1985/2020 {
	append using POS_Hospitals_`i'.dta
}

save NursingHomeQuantity, replace 

*-------------------------------------------------------------------------------
* Total Skilled Nursing Homes per State 
* ------------------------------------------------------------------------------
clear
global category "prvdr_ctgry_cd == 4"

forvalues i = 1991/2020 {

use pos`i'.dta
gen Q_SkilledNursingHomes = 1
destring prvdr_ctgry_cd, replace
destring ssa_state_cd, replace
keep if $category
collapse (sum) Q_SkilledNursingHomes, by(ssa_state_cd)
gen year= `i'

save POS_Hospitals_`i', replace
}

clear
forvalues i = 1984/1990 {

use pos`i'.dta
gen Q_SkilledNursingHomes = 1
rename state ssa_state_cd
rename category prvdr_ctgry_cd
destring prvdr_ctgry_cd, replace
destring ssa_state_cd, replace

keep if $category
collapse (sum) Q_SkilledNursingHomes, by(ssa_state_cd)
gen year= `i'

save POS_Hospitals_`i', replace
}

clear
use POS_Hospitals_1984.dta
forvalues i = 1985/2020 {
	append using POS_Hospitals_`i'.dta
}

save SkilledNursingHomeQuantity, replace 

*-------------------------------------------------------------------------------
* Total Nursing Home Beds per State 
* ------------------------------------------------------------------------------
clear
global category "prvdr_ctgry_cd == 2 | prvdr_ctgry_cd == 3 | prvdr_ctgry_cd == 4 | prvdr_ctgry_cd == 10 "

forvalues i = 1991/2020 {

use pos`i'.dta
destring prvdr_ctgry_cd, replace
destring ssa_state_cd, replace
keep if $category
collapse (sum) bed_cnt, by(ssa_state_cd)
gen year= `i'

save POS_Hospitals_`i', replace
}

clear
forvalues i = 1984/1990 {

use pos`i'.dta
rename state ssa_state_cd
rename category prvdr_ctgry_cd
destring prvdr_ctgry_cd, replace
destring ssa_state_cd, replace

rename prov0740 bed_cnt, capture
keep if $category
collapse (sum) bed_cnt, by(ssa_state_cd)
gen year= `i'

save POS_Hospitals_`i', replace
}

clear
use POS_Hospitals_1984.dta
forvalues i = 1985/2020 {
	append using POS_Hospitals_`i'.dta
}

rename bed_cnt Q_NursingHomeBeds
save NursingHomeBeds, replace 

*-------------------------------------------------------------------------------
* Total Skilled Nursing Home Beds per State 
* ------------------------------------------------------------------------------
clear
global category "prvdr_ctgry_cd == 4"

forvalues i = 1991/2020 {

use pos`i'.dta
destring prvdr_ctgry_cd, replace
destring ssa_state_cd, replace
keep if $category
collapse (sum) bed_cnt, by(ssa_state_cd)
gen year= `i'

save POS_Hospitals_`i', replace
}

clear
forvalues i = 1984/1990 {

use pos`i'.dta
rename state ssa_state_cd
rename category prvdr_ctgry_cd
destring prvdr_ctgry_cd, replace
destring ssa_state_cd, replace

rename prov0740 bed_cnt, capture
keep if $category
collapse (sum) bed_cnt, by(ssa_state_cd)
gen year= `i'

save POS_Hospitals_`i', replace
}

clear
use POS_Hospitals_1984.dta
forvalues i = 1985/2020 {
	append using POS_Hospitals_`i'.dta
}

rename bed_cnt Q_SkilledNursingHomeBeds

save SkilledNursingHomeBeds, replace 

*-------------------------------------------------------------------------------
* Creating FIPs code for all datasets
* ------------------------------------------------------------------------------


foreach x in NursingHomeQuantity SkilledNursingHomeQuantity NursingHomeBeds SkilledNursingHomeBeds  { 

clear
use `x'.dta

gen fips = .
replace fips =1 if ssa_state_cd==1
replace fips =2 if ssa_state_cd==2
replace fips =4 if ssa_state_cd==3
replace fips =5 if ssa_state_cd==4
replace fips =6 if ssa_state_cd==5
replace fips =8 if ssa_state_cd==6
replace fips =9 if ssa_state_cd==7
replace fips =10 if ssa_state_cd==8
replace fips =11 if ssa_state_cd==9
replace fips =12 if ssa_state_cd==10
replace fips =13 if ssa_state_cd==11
replace fips =15 if ssa_state_cd==12
replace fips =16 if ssa_state_cd==13
replace fips =17 if ssa_state_cd==14
replace fips =18 if ssa_state_cd==15
replace fips =19 if ssa_state_cd==16
replace fips =20 if ssa_state_cd==17
replace fips =21 if ssa_state_cd==18
replace fips =22 if ssa_state_cd==19
replace fips =23 if ssa_state_cd==20
replace fips =24 if ssa_state_cd==21
replace fips =25 if ssa_state_cd==22
replace fips =26 if ssa_state_cd==23
replace fips =27 if ssa_state_cd==24
replace fips =28 if ssa_state_cd==25
replace fips =29 if ssa_state_cd==26
replace fips =30 if ssa_state_cd==27
replace fips =31 if ssa_state_cd==28
replace fips =32 if ssa_state_cd==29
replace fips =33 if ssa_state_cd==30
replace fips =34 if ssa_state_cd==31
replace fips =35 if ssa_state_cd==32
replace fips =36 if ssa_state_cd==33
replace fips =37 if ssa_state_cd==34
replace fips =38 if ssa_state_cd==35
replace fips =39 if ssa_state_cd==36
replace fips =40 if ssa_state_cd==37
replace fips =41 if ssa_state_cd==38
replace fips =42 if ssa_state_cd==39
replace fips =44 if ssa_state_cd==41
replace fips =45 if ssa_state_cd==42
replace fips =46 if ssa_state_cd==43
replace fips =47 if ssa_state_cd==44
replace fips =48 if ssa_state_cd==45
replace fips =49 if ssa_state_cd==46
replace fips =50 if ssa_state_cd==47
replace fips =51 if ssa_state_cd==49
replace fips =53 if ssa_state_cd==50
replace fips =54 if ssa_state_cd==51
replace fips =55 if ssa_state_cd==52
replace fips =56 if ssa_state_cd==53

drop ssa_state_cd
drop if fips==.

save `x'.dta, replace		
}

foreach x in NursingHomeQuantity SkilledNursingHomeQuantity NursingHomeBeds SkilledNursingHomeBeds  { 

clear
use `x'.dta

rename fips id 

save `x'.dta, replace
}
























*-------------------------------------------------------------------------------
* Total Hospitals In Rural Arteas per State 
* ------------------------------------------------------------------------------

forvalues i = 1991/2020 {

use pos`i'.dta
gen Q_Hospitals = 1
destring prvdr_ctgry_cd, replace
destring ssa_state_cd, replace
keep if $category
collapse (sum) Q_Hospitals, by(ssa_state_cd)
gen year= `i'

save POS_Hospitals_`i', replace
}

clear
forvalues i = 1984/1990 {

use pos`i'.dta
gen Q_Hospitals = 1
rename state ssa_state_cd
rename category prvdr_ctgry_cd
destring prvdr_ctgry_cd, replace
destring ssa_state_cd, replace

keep if $category
collapse (sum) Q_Hospitals, by(ssa_state_cd)
gen year= `i'

save POS_Hospitals_`i', replace
}

clear
use POS_Hospitals_1984.dta
forvalues i = 1985/2020 {
	append using POS_Hospitals_`i'.dta
}

save HospitalQuantity_Complete, replace 

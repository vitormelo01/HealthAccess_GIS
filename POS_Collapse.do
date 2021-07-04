*-------------------------------------------------------------------------------
* Cleaning and Appending Access Data
* ------------------------------------------------------------------------------


clear
cd "D:\OneDrive\Research_Resources\HealthAccess_Resources\POS_Data"

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
global category "prvdr_ctgry_cd == 2 | prvdr_ctgry_cd == 3 | prvdr_ctgry_cd == 4"

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
global category "prvdr_ctgry_cd == 2 | prvdr_ctgry_cd == 3 | prvdr_ctgry_cd == 4 "

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

clear
cd "C:\Users\vitor\OneDrive\Research_Resources\GIS_HealthAccess_Resources\Data"

insheet using "geocoded_Jan25.csv"

rename user_prvdr_ctgry_cd provider_catagory
rename user_prvdr_num provider_number
rename x longitude
rename y latitude

keep provider_catagory provider_number longitude latitude

save geocoded_cleaned
outsheet using "HealthProviderCoodinates.csv"

clear

*Creating the data files that will be used in driving distance analysis
clear
cd "C:\Users\vitor\OneDrive\Combined_CON_Research\Data"

forvalues z = 1991/2020  {
    clear
	use "pos`z'.dta"

keep prvdr_ctgry_cd prvdr_num
rename prvdr_ctgry_cd provider_catagory
rename prvdr_num provider_number 
destring provider_catagory, replace
destring provider_number , replace

merge 1:m provider_number using geocoded_cleaned.dta 
drop if _merge==2
drop _merge 
save Geo_POS_AllServices`z', replace 

foreach i in 1 4 6 8 9 11 12 14 15 16 19 21 {
    clear
	use "Geo_POS_AllServices`z'.dta"
	keep if provider_catagory == `i'
	save Service`i'_`z', replace
	
}
	
clear	
	
}



use Service1_1991.dta
outsheet using "Service1_1991.csv", comma





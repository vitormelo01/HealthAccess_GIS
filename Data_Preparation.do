clear

* Setting Env Variables
global directory: env HealthAccessDirectory

* Setting Directory
cd "$directory"

forvalues i = 1991/2020 { 
	
	
use pos`i'.dta

destring ssa_state_cd, replace
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

rename fips id
gen state="."
replace state="Alabama" if id == 1
replace state="Alaska" if id == 2
replace state="Arizona" if id == 4 
replace state="Arkansas" if id == 5
replace state="California" if id == 6
replace state="Colorado" if id == 8
replace state="Connecticut" if id == 9
replace state="Delaware" if id == 10
replace state="District of Columbia" if id == 11
replace state="Florida" if id == 12 
replace state="Georgia" if id == 13
replace state="Hawaii" if id == 15 
replace state="Idaho" if id == 16 
replace state="Illinois" if id == 17 
replace state="Indiana" if id == 18 
replace state="Iowa" if id == 19 
replace state="Kansas" if id == 20
replace state="Kentucky" if id == 21
replace state="Louisiana" if id == 22
replace state="Maine" if id == 23
replace state="Maryland" if id == 24
replace state="Massachusetts" if id == 25
replace state="Michigan" if id == 26 
replace state="Minnesota" if id == 27
replace state="Mississippi" if id == 28
replace state="Missouri" if id == 29
replace state="Montana" if id == 30
replace state="Nebraska" if id == 31
replace state="Nevada" if id == 32
replace state="New Hampshire" if id == 33
replace state="New Jersey" if id == 34
replace state="New Mexico" if id == 35
replace state="New York" if id == 36
replace state="North Carolina" if id == 37
replace state="North Dakota" if id == 38 
replace state="Ohio" if id == 39
replace state="Oklahoma" if id == 40
replace state="Oregon" if id == 41
replace state="Pennsylvania" if id == 42
replace state="Rhode Island" if id == 44
replace state="South Carolina" if id == 45
replace state="South Dakota" if id == 46
replace state="Tennessee" if id == 47
replace state="Texas" if id == 48
replace state="Utah" if id == 49
replace state="Vermont" if id == 50 
replace state="Virginia" if id == 51
replace state="Washington" if id == 53
replace state="West Virginia" if id == 54
replace state="Wisconsin" if id == 55
replace state="Wyoming" if id == 56

save pos_cleaned_`i'
}

forvalues i = 1991/2020 { 
	
clear
use pos_cleaned_`i'

destring, replace

save pos_cleaned_`i', replace
}

* Appending all years fo data
clear 
use pos_cleaned_1991.dta
forvalues i = 1992/2020 { 

	append using pos_cleaned_`i'.dta, force
	}
	
save pos_cleaned, replace

clear
use pos_cleaned.dta

duplicates report prvdr_num

duplicates drop prvdr_num, force

save pos_preparedGIS, replace 

export delimited using "pos_preparedGIS"























use "POS2020.dta"

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

rename fips id
gen state="."
replace state="Alabama" if id == 1
replace state="Alaska" if id == 2
replace state="Arizona" if id == 4 
replace state="Arkansas" if id == 5
replace state="California" if id == 6
replace state="Colorado" if id == 8
replace state="Connecticut" if id == 9
replace state="Delaware" if id == 10
replace state="District of Columbia" if id == 11
replace state="Florida" if id == 12 
replace state="Georgia" if id == 13
replace state="Hawaii" if id == 15 
replace state="Idaho" if id == 16 
replace state="Illinois" if id == 17 
replace state="Indiana" if id == 18 
replace state="Iowa" if id == 19 
replace state="Kansas" if id == 20
replace state="Kentucky" if id == 21
replace state="Louisiana" if id == 22
replace state="Maine" if id == 23
replace state="Maryland" if id == 24
replace state="Massachusetts" if id == 25
replace state="Michigan" if id == 26 
replace state="Minnesota" if id == 27
replace state="Mississippi" if id == 28
replace state="Missouri" if id == 29
replace state="Montana" if id == 30
replace state="Nebraska" if id == 31
replace state="Nevada" if id == 32
replace state="New Hampshire" if id == 33
replace state="New Jersey" if id == 34
replace state="New Mexico" if id == 35
replace state="New York" if id == 36
replace state="North Carolina" if id == 37
replace state="North Dakota" if id == 38 
replace state="Ohio" if id == 39
replace state="Oklahoma" if id == 40
replace state="Oregon" if id == 41
replace state="Pennsylvania" if id == 42
replace state="Rhode Island" if id == 44
replace state="South Carolina" if id == 45
replace state="South Dakota" if id == 46
replace state="Tennessee" if id == 47
replace state="Texas" if id == 48
replace state="Utah" if id == 49
replace state="Vermont" if id == 50 
replace state="Virginia" if id == 51
replace state="Washington" if id == 53
replace state="West Virginia" if id == 54
replace state="Wisconsin" if id == 55
replace state="Wyoming" if id == 56

export delimited using "POS2020"


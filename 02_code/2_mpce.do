/*-------------------------------------
File: 2_mpce.do
Purpose: Replicate MPCE estimates from survey
Author: Advait Moharir
Date: 09/06/2024
----------------------------------------*/

// Load level 14 data

use "$clean/level_14", clear
gen weight=multiplier/100

/*-------------------------------------
FOOD EXPENDITURE
----------------------------------------*/

* Food (Monthly)

preserve
keep if questionnaire_num=="F"
keep if inlist(item_code,129,139,159,179)
collapse (sum) value,by(hhid)
rename value food_monthly
tempfile f1
save `f1', replace
restore

* Food (Weekly)

preserve
keep if questionnaire_num=="F"
keep if inlist(item_code,169, 219, 239, 249, 199, 189, 269, 279, 289, 299)
collapse (sum) value,by(hhid)
replace value=value*(30/7)
rename value food_weekly
tempfile f2
save `f2', replace
restore

preserve
use `f1', clear
merge 1:1 hhid using `f2', force nogen
replace food_monthly=0 if mi(food_monthly)
replace food_weekly=0 if mi(food_weekly)
gen food_exp=food_weekly+food_monthly
tempfile food
save `food', replace
restore
/*-------------------------------------
CONSUMABLES EXPENDITURE
----------------------------------------*/

* Consumables (Monthly)

preserve
keep if questionnaire_num=="C"
keep if inlist(item_code,349, 459, 479, 429, 519, 499, 439, 529)
collapse (sum) value,by(hhid)
rename value consum_monthly
tempfile c1
save `c1', replace
restore

* Consumables (Weekly)

preserve
keep if questionnaire_num=="C"
keep if inlist(item_code,309,319,329)
collapse (sum) value,by(hhid)
replace value=value*(30/7)
rename value consum_weekly
tempfile c2
save `c2', replace
restore

* Consumables (Annual)

preserve
keep if questionnaire_num=="C"
keep if inlist(item_code,409,419,899)
collapse (sum) value,by(hhid)
replace value=value*(30/365)
rename value consum_annual
tempfile c3
save `c3', replace
restore

* Total Consumables Expenditure
preserve
use `c1', clear
merge 1:1 hhid using `c2', force nogen
merge 1:1 hhid using `c3', force nogen
replace consum_monthly=0 if mi(consum_monthly)
replace consum_weekly=0 if mi(consum_weekly)
replace consum_annual=0 if mi(consum_annual)
gen consum_exp=consum_monthly+consum_weekly+consum_annual
tempfile consum
save `consum', replace
restore

/*-------------------------------------
DURABLES EXPENDITURE
----------------------------------------*/

preserve
keep if questionnaire_num=="D"
collapse (sum) value,by(hhid)
replace value=value*(30/365)
rename value durables_exp
tempfile dur
save `dur', replace
restore

// Combine all

use `food', clear
merge 1:1 hhid using `dur', force nogen
merge 1:1 hhid using `consum', force nogen

// Add all
replace durables_exp=0 if mi(durables_exp)
replace food_exp=0 if mi(food_exp)
replace consum_exp=0 if mi(consum_exp)
tempfile all
save `all', replace

/*-------------------------------------
HH-SIZE
----------------------------------------*/

// Load level 15


use "$clean/level_15", clear
gen weights=multiplier/100
drop multiplier
keep hhid hh_size questionnaire_num weights

reshape wide hh_size, i(hhid weights) j(questionnaire_num) string
drop hh_sizeH

merge 1:1 hhid using `all', force nogen

// Calculate mpce

gen tot_exp=food_exp + (consum_exp*(hh_sizeF/hh_sizeC))+ (durables_exp *(hh_sizeF/hh_sizeD))
gen mpce=tot_exp/hh_sizeF

// Get sector

merge 1:1 hhid using "$clean/level_01", force nogen keepusing(sector)

save "$clean/mpce",replace

/*-------------------------------------
MPCE: BY SECTOR
----------------------------------------*/
use "$clean/mpce",clear
collapse (sum) tot_exp hh_sizeF[aw=weights] ,by(sector)
gen mpce=tot_exp/hh_sizeF // Sector 1=Rural, Sector 2=Urban

/*-------------------------------------
MPCE: BY SECTOR AND FRACTILES
----------------------------------------*/

// MPCE Average by Sector X Fractiles
use "$clean/mpce", clear
merge 1:m hhid using "$clean/level_03", force nogen // pull hh_size
keep hhid tot_exp hh_sizeF sector hh_size weights multiplier

// Sectorwise

forval i=1(1)2{
preserve
keep if sector==`i'

// Calculate MPCE at household level
gen mpce = tot_exp / hh_sizeF

// Sort by MPCE
sort mpce

// Calculate individual and cumulative population
gen pop = weights * hh_size
gen cumul_pop = sum(pop)

// Get total population
egen total_pop = total(pop)

// using density function to make fractiles, of 10 bins
gen pop_percentage = cumul_pop / total_pop * 100

// Get fractiles, ie divide the distrbution based on propotion of sample.
gen fractile = ""
replace fractile = "0-5" if pop_percentage <= 5
replace fractile = "5-10" if pop_percentage > 5 & pop_percentage <= 10
replace fractile = "10-20" if pop_percentage > 10 & pop_percentage <= 20
replace fractile = "20-30" if pop_percentage > 20 & pop_percentage <= 30
replace fractile = "30-40" if pop_percentage > 30 & pop_percentage <= 40
replace fractile = "40-50" if pop_percentage > 40 & pop_percentage <= 50
replace fractile = "50-60" if pop_percentage > 50 & pop_percentage <= 60
replace fractile = "60-70" if pop_percentage > 60 & pop_percentage <= 70
replace fractile = "70-80" if pop_percentage > 70 & pop_percentage <= 80
replace fractile = "80-90" if pop_percentage > 80 & pop_percentage <= 90
replace fractile = "90-95" if pop_percentage > 90 & pop_percentage <= 95
replace fractile = "95-100" if pop_percentage > 95


// Generate MPCE numbers

collapse (sum) tot_exp hh_sizeF[aw=weights] ,by(fractile)

gen mpce_`i'=tot_exp/hh_sizeF
keep fractile mpce_`i'
tempfile sector_`i'
save `sector_`i'', replace
restore
}

// Merge both together

use `sector_1', clear
merge 1:1 fractile using `sector_2', force nogen





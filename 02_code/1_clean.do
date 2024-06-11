/*-------------------------------------
File: 1_clean.do
Purpose: Clean HCES 2022-23 data
Author: Advait Moharir
Date: 09/06/2024
----------------------------------------*/

*-----------------------------------
*SECTION-1:LEVEL-1
*-------------------------------------

// import using space delimiters to begin with

import delimited using "$raw/hces22_lvl_01.txt",clear

// Extract relevant identifiers using "Layout_HCES_2022-23.xlslx"
gen hhid=substr(v1,1,38)
gen survey_name=substr(v1,1,4)
gen year=substr(v1,5,4)
gen fsu_serial_no=substr(v1,9,5)
gen sector=substr(v1,14,1)
gen state=substr(v1,15,2)
gen nss_region=substr(v1,17,3)
gen district=substr(v1,20,2) 
gen stratum=substr(v1,22,2)
gen sub_stratum=substr(v1,24,2)
gen panel=substr(v1,25,2)
gen subsample=substr(v1,28,1)
gen fod_subregion=substr(v1,29,4)
gen sample_su_num=substr(v1,33,2)
gen sample_subdiv_num=substr(v1,35,1)
gen sec_stage_stratum_num=substr(v1,36,1)
gen sample_hhld_num=substr(v1,37,2)
gen questionnaire_num=substr(v1,39,1)
gen level=substr(v1,40,2)
gen svy_code=substr(v1,42,1)
gen subcode_reason=substr(v1,43,1)
gen multiplier=substr(v1,44,15)

// destring and cleanup

drop v1
destring year-sample_subdiv_num level-multiplier,force replace

// Save

save "$clean/level_01.dta", replace

*-----------------------------------
*SECTION-2:LEVEL-2
*-------------------------------------


import delimited using "$raw/hces22_lvl_02.txt",clear

// Cleanup

gen hhid=substr(v1,1,38)
gen questionnaire_num=substr(v1,39,1)
gen level=substr(v1,40,2)
gen person_id=substr(v1,42,2)
gen rel_to_hoh=substr(v1,44,1)
gen gender=substr(v1,45,1)
gen age=substr(v1,46,3)
gen marital_status=substr(v1,49,1)
gen edu_level=substr(v1,50,2)
gen edu_years=substr(v1,52,2)
gen used_internet=substr(v1,54,1)
gen days_outside_home=substr(v1,55,2)
gen meals_daily=substr(v1,57,1)
gen meals_school=substr(v1,58,2)
gen meals_employer=substr(v1,60,2)
gen meals_others=substr(v1,62,2)
gen meals_payment=substr(v1,64,2)
gen meals_home=substr(v1,66,2)
gen member_status=substr(v1,68,1)
gen original_member=substr(v1,69,1)
gen multiplier=substr(v1,70,15)

drop v1
destring level-multiplier,force replace


// Save

save "$clean/level_02.dta", replace


*-----------------------------------
*SECTION-3:LEVEL-3
*-------------------------------------

import delimited using "$raw/hces22_lvl_03.txt",clear

// Cleanup

gen hhid=substr(v1,1,38)
gen questionnaire_num=substr(v1,39,1)
gen level=substr(v1,40,2)
gen hh_size=substr(v1,42,2)
gen employed_annual=substr(v1,44,1)
gen nco_2015=substr(v1,54,3)
gen nic_2008=substr(v1,48,5)
gen num_activities_income=substr(v1,53,1)
gen hasincome_selfemp_agri=substr(v1,54,1)
gen hasincome_wage_agri=substr(v1,55,1)
gen hasincome_casual_agri=substr(v1,56,1)
gen hh_type=substr(v1,57,1)
gen hoh_religion=substr(v1,58,1)
gen caste=substr(v1,59,1)
gen has_land=substr(v1,60,1)
gen land_type=substr(v1,61,1)
gen land_area=substr(v1,62,9)
gen has_house=substr(v1,71,1)
gen type_house=substr(v1,72,1)
gen material_wall=substr(v1,73,1)
gen material_roof=substr(v1,74,1)
gen material_floor=substr(v1,75,1)
gen source_cooking=substr(v1,76,2)
gen source_lighting=substr(v1,78,1)
gen source_water=substr(v1,79,2)
gen time_water=substr(v1,81,3)
gen level_access_latrine=substr(v1,84,1)
gen type_latrine=substr(v1,85,2)
gen type_rationcard=substr(v1,87,1)
gen is_rent=substr(v1,88,1)
gen has_pmgky=substr(v1,89,1)
gen has_young_died=substr(v1,90,1)
gen num_young_died=substr(v1,91,1)
gen multiplier=substr(v1,93,15)

// destring

drop v1
destring level-multiplier, force replace

//save

save "$clean/level_03", replace

*-----------------------------------
*SECTION-4:LEVEL-4
*-----------------------------------

import delimited using "$raw/hces22_lvl_04.txt",clear

// Cleanup

gen hhid=substr(v1,1,38)
gen questionnaire_num=substr(v1,39,1)
gen level=substr(v1,40,2)
gen used_ration=substr(v1,42,1)
gen procured_rice=substr(v1,43,1)
gen procured_wheat=substr(v1,44,1)
gen procured_grain=substr(v1,45,1)
gen procured_sugar=substr(v1,46,1)
gen procured_pulses=substr(v1,47,1)
gen procured_edible_oil=substr(v1,48,1)
gen procured_other=substr(v1,49,1)
gen online_groceries=substr(v1,50,1)
gen online_milkprod=substr(v1,51,1)
gen online_veg=substr(v1,52,1)
gen online_fruits=substr(v1,53,1)
gen online_dryfruits=substr(v1,54,1)
gen online_eggfishmeat=substr(v1,55,1)
gen online_processed_served=substr(v1,56,1)
gen online_processed_packed=substr(v1,57,1)
gen online_other=substr(v1,58,1)
gen performed_ceremony=substr(v1,59,1)
gen meals_nonhh=substr(v1,60,4)
gen multiplier=substr(v1,64,15)

// destring
drop v1
destring level-multiplier, force replace

//save

save "$clean/level_04", replace

*-----------------------------------
*SECTION-5:LEVEL-5
*-----------------------------------

import delimited using "$raw/hces22_lvl_05.txt",clear

// Cleanup

gen hhid=substr(v1,1,38)
gen questionnaire_num=substr(v1,39,1)
gen level=substr(v1,40,2)
gen item_code=substr(v1,42,3)
gen cons_home_qty=substr(v1,45,10)
gen cons_home_value=substr(v1,55,8)
gen cons_total_qty=substr(v1,63,10)
gen cons_total_value=substr(v1,73,8)
gen source=substr(v1,81,1)
gen multiplier=substr(v1,82,15)

// destring
drop v1
destring level-multiplier, force replace

//save

save "$clean/level_05", replace

*-----------------------------------
*SECTION-6:LEVEL-6
*-----------------------------------

import delimited using "$raw/hces22_lvl_06.txt",clear

// Cleanup

gen hhid=substr(v1,1,38)
gen questionnaire_num=substr(v1,39,1)
gen level=substr(v1,40,2)
gen item_code=substr(v1,42,3)
gen cons_total_qty=substr(v1,45,10)
gen cons_total_value=substr(v1,55,8)
gen source=substr(v1,63,1)
gen multiplier=substr(v1,64,15)

// destring
drop v1
destring level-multiplier, force replace

//save

save "$clean/level_06", replace


*-----------------------------------
*SECTION-7: LEVEL-7
*-----------------------------------

import delimited using "$raw/hces22_lvl_07.txt",clear

// Cleanup

gen hhid=substr(v1,1,38)
gen questionnaire_num=substr(v1,39,1)
gen level=substr(v1,40,2)
gen procured_kerosene_ration =substr(v1,42,1)
gen receieved_subsidy_lpg=substr(v1,43,1)
gen num_subsidized_lpg=substr(v1,44,2)
gen received_free_electricity=substr(v1,46,1)
gen is_hhmem_edu=substr(v1,47,1)
gen num_hhmem_publicedu=substr(v1,48,3)
gen num_hhmem_privedu=substr(v1,51,3)
gen recieved_free_textbook=substr(v1,54,1)
gen num_free_textbook=substr(v1,55,3)
gen recieved_free_stationary=substr(v1,58,1)
gen num_free_stationary=substr(v1,59,3)
gen recieved_free_schoolbag=substr(v1,62,1)
gen num_free_schoolbag=substr(v1,63,3)
gen recieved_free_oth=substr(v1,66,1)
gen num_free_oth=substr(v1,67,3)
gen recieved_fee_waiver=substr(v1,70,1)
gen num_hhmem_waiver=substr(v1,71,2)
gen is_hhmem_pmjay=substr(v1,73,1)
gen num_hhmem_pmjay=substr(v1,74,2)
gen is_hospitalization=substr(v1,76,1)
gen is_benefit_healthscheme=substr(v1,77,1)
gen num_benefit_healthscheme=substr(v1,78,2)
gen amt_benefit_healthscheme=substr(v1,80,8)
gen online_fuel=substr(v1,88,1)
gen online_toilet=substr(v1,89,1)
gen online_edu=substr(v1,90,1)
gen online_medicine=substr(v1,91,1)
gen online_services=substr(v1,92,1)
gen has_internet=substr(v1,93,1)
gen multiplier=substr(v1,94,15)



// destring
drop v1
destring level-multiplier, force replace

//save

save "$clean/level_07", replace


*-----------------------------------
*SECTION-8: LEVEL-8
*-----------------------------------

import delimited using "$raw/hces22_lvl_08.txt",clear

// Cleanup

gen hhid=substr(v1,1,38)
gen questionnaire_num=substr(v1,39,1)
gen level=substr(v1,40,2)
gen item_code=substr(v1,42,3)
gen cons_home_qty=substr(v1,45,10)
gen cons_home_value=substr(v1,55,8)
gen cons_total_qty=substr(v1,63,10)
gen cons_total_value=substr(v1,73,8)
gen source=substr(v1,81,1)
gen multiplier=substr(v1,82,15)

// destring
drop v1
destring level-multiplier, force replace

//save

save "$clean/level_08", replace



*-----------------------------------
*SECTION-9: LEVEL-9
*-----------------------------------

import delimited using "$raw/hces22_lvl_09.txt",clear

// Cleanup

gen hhid=substr(v1,1,38)
gen questionnaire_num=substr(v1,39,1)
gen level=substr(v1,40,2)
gen item_code=substr(v1,42,3)
gen cons_total_value=substr(v1,45,8)
gen multiplier=substr(v1,53,15)

// destring
drop v1
destring level-multiplier, force replace

//save

save "$clean/level_09", replace

*-----------------------------------
*SECTION-10: LEVEL-10
*-----------------------------------

import delimited using "$raw/hces22_lvl_10.txt",clear

// Cleanup

gen hhid=substr(v1,1,38)
gen questionnaire_num=substr(v1,39,1)
gen level=substr(v1,40,2)
gen item_code=substr(v1,42,3)
gen cons_home_qty=substr(v1,45,10)
gen cons_home_value=substr(v1,55,8)
gen cons_total_qty=substr(v1,63,10)
gen cons_total_value=substr(v1,73,8)
gen source=substr(v1,81,1)
gen multiplier=substr(v1,82,15)

// destring
drop v1
destring level-multiplier, force replace

//save

save "$clean/level_10", replace

*-----------------------------------
*SECTION-11: LEVEL-11
*-----------------------------------

import delimited using "$raw/hces22_lvl_11.txt",clear

// Cleanup

gen hhid=substr(v1,1,38)
gen questionnaire_num=substr(v1,39,1)
gen level=substr(v1,40,2)
gen online_clothing=substr(v1,42,1)
gen online_footwear=substr(v1,43,1)
gen online_furniture=substr(v1,44,1)
gen online_mobile=substr(v1,45,1)
gen online_personal_goods=substr(v1,46,1)
gen online_rec=substr(v1,47,1)
gen online_cooking=substr(v1,48,1)
gen online_crockery=substr(v1,49,1)
gen online_sports=substr(v1,50,1)
gen online_medical=substr(v1,51,1)
gen online_bedding=substr(v1,52,1)
gen receieved_free_laptop=substr(v1,53,1)
gen num_free_laptop=substr(v1,54,3)
gen receieved_free_tab=substr(v1,57,1)
gen num_free_tab=substr(v1,58,3)
gen receieved_free_mobile=substr(v1,61,1)
gen num_free_mobile=substr(v1,62,3)
gen receieved_free_bicycle=substr(v1,65,1)
gen num_free_bicycle=substr(v1,66,3)
gen receieved_free_bike=substr(v1,69,1)
gen num_free_bike=substr(v1,70,3)
gen receieved_free_clothing=substr(v1,73,1)
gen num_free_clothing=substr(v1,74,3)
gen receieved_free_footwear=substr(v1,77,1)
gen num_free_footwear=substr(v1,78,3)
gen receieved_free_oth=substr(v1,81,1)
gen num_free_oth=substr(v1,82,3)
gen has_tv=substr(v1,85,1)
gen has_radio=substr(v1,86,1)
gen has_laptop=substr(v1,87,1)
gen has_mobile=substr(v1,88,1)
gen has_bicycle=substr(v1,89,1)
gen has_bike=substr(v1,90,1)
gen has_car=substr(v1,91,1)
gen has_truck=substr(v1,92,1)
gen has_animalcart=substr(v1,93,1)
gen has_fridge=substr(v1,94,1)
gen has_washingmachine=substr(v1,95,1)
gen has_ac=substr(v1,96,1)
gen type_tv=substr(v1,97,1)
gen multiplier=substr(v1,98,15)


// destring
drop v1
destring level-multiplier, force replace




//save

save "$clean/level_11", replace


*-----------------------------------
*SECTION-12: LEVEL-12
*-----------------------------------

import delimited using "$raw/hces22_lvl_12.txt",clear

// Cleanup

gen hhid=substr(v1,1,38)
gen questionnaire_num=substr(v1,39,1)
gen level=substr(v1,40,2)
gen item_code=substr(v1,42,3)
gen cons_total_qty=substr(v1,45,10)
gen cons_total_value=substr(v1,55,8)
gen multiplier=substr(v1,63,15)

// destring
drop v1
destring level-multiplier, force replace

//save

save "$clean/level_12", replace

*-----------------------------------
*SECTION-13: LEVEL-13
*-----------------------------------

import delimited using "$raw/hces22_lvl_13.txt",clear

// Cleanup

gen hhid=substr(v1,1,38)
gen questionnaire_num=substr(v1,39,1)
gen level=substr(v1,40,2)
gen item_code=substr(v1,42,3)
gen num_firsthand_purchase=substr(v1,45,3)
gen is_purchased_onhire=substr(v1,48,1)
gen val_firsthand_purchase=substr(v1,49,8)
gen repair_cost=substr(v1,57,8)
gen num_secondhand_purchase=substr(v1,65,3)
gen val_secondhand_purchase=substr(v1,68,8)
gen tot_expenditure=substr(v1,76,8)
gen multiplier=substr(v1,84,15)

// destring
drop v1
destring level-multiplier, force replace

//save

save "$clean/level_13", replace



*-----------------------------------
*SECTION-13: LEVEL-14
*-----------------------------------

import delimited using "$raw/hces22_lvl_14.txt",clear

// Cleanup

gen hhid=substr(v1,1,38)
gen questionnaire_num=substr(v1,39,1)
gen level=substr(v1,40,2)
gen section=substr(v1,42,5)
gen item_code=substr(v1,47,3)
gen value=substr(v1,50,10)
gen multiplier=substr(v1,60,15)
// destring
drop v1
destring level-multiplier, force replace

//save

save "$clean/level_14", replace


*-----------------------------------
*SECTION-15: LEVEL-15
*-----------------------------------

import delimited using "$raw/hces22_lvl_15.txt",clear

// Cleanup

gen hhid=substr(v1,1,38)
gen questionnaire_num=substr(v1,39,1)
gen level=substr(v1,40,2)
gen section=substr(v1,42,2)
gen time_taken=substr(v1,44,3)
gen hh_usual_cons_exp_mnth=substr(v1,47,8)
gen tot_online_exp=substr(v1,55,8)
gen informant_code=substr(v1,63,2)
gen response_code=substr(v1,65,1)
gen hh_size=substr(v1,66,3)
gen multiplier=substr(v1,69,15)
// destring
drop v1
destring level-multiplier, force replace

//save

save "$clean/level_15", replace








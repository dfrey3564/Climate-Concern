* Update the path below to match your local file location
* Data available at: https://www.europeansocialsurvey.org/
use "ESS_NL_Round11.dta.dta"
*For restarting use "", clear

keep if essround == 11

*For removing unused values
replace wrclmch  = . if inlist(wrclmch, 7, 8, 9)
replace lrscale  = . if inlist(lrscale, 77, 88, 99)
replace ppltrst  = . if inlist(ppltrst, 77, 88, 99)
replace hinctnta = . if inlist(hinctnta, 77, 88, 99)
replace polintr  = . if inlist(polintr, 7, 8, 9)
replace gndr     = . if inlist(gndr, 7, 8, 9)
replace edulvlb  = . if inlist(edulvlb, 7777, 8888, 9999)

*Variables creation
gen concern = wrclmch
gen ideology = lrscale
gen trust = ppltrst
gen income = hinctnta
gen polinterest = polintr
capture drop age
gen age = agea
*Capture for age dropping issue due to variable conflict


label variable concern "Climate concern (1-5)"
label variable ideology "Left-right ideology (0-10)"
label variable trust "Trust (0-10)"
label variable age "Age (years)"
label variable income "Household income decile (1-10)"
label variable polinterest "Political interest (1-4)"

*Dummy variable creation
gen edu_tertiary = inlist(edulvlb, 510, 520, 610, 620, 710, 720, 800)
gen female = .
replace female = 0 if gndr == 1
replace female = 1 if gndr == 2
label define fem 0 "Male" 1 "Female"
label values female fem
label variable female "Female (1=yes)"
label variable edu_tertiary "Tertiary education (ISCED 5+)"
*Variable check incase of further unintended dropping
misstable summarize concern ideology trust age income polinterest female edu_tertiary

*Removal of unused variables from ESS 11
drop if missing(concern, ideology, trust, age, income, polinterest, female, edu_tertiary)
count

*ttest(bivariate)
ttest concern, by(edu_tertiary)

*Descriptive
summ concern ideology trust age income polinterest female edu_tertiary

* Regressions
reg concern trust ideology, vce(robust)
eststo m1

reg concern trust ideology age income polinterest female edu_tertiary, vce(robust)
eststo m2

*VIF Check
vif

*Table export
label var trust        "Trust (0–10)" 
label var ideology     "Left–right ideology (0–10)"
label var age          "Age (years)"
label var income       "Household income (1–10)"
label var polinterest  "Political interest (1–4)"
label var female       "Female (1=yes)"
label var edu_tertiary "Tertiary education (1=yes)"

esttab m1 m2 using "results_table.docx", replace b(3) se(3) se star(* 0.10 ** 0.05 *** 0.01) mtitles("Model 1" "Model 2") varlabels(trust "Trust (0–10)" ideology "Left–right ideology (0–10)" age "Age (years)" income "Household income (1–10)" polinterest "Political interest (1–4)" female "Female (1=yes)" edu_tertiary "Tertiary education (1=yes)" _cons "Constant") varwidth(32) stats(N r2, labels("Observations" "R-squared") fmt(0 3)) compress nogaps parentheses

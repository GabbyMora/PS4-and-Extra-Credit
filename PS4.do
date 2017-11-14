
Skip to content
This repository

    Pull requests
    Issues
    Marketplace
    Explore

    @theaok

1
0

    0

GabbyMora/PS4-and-Extra-Credit
Code
Issues 0
Pull requests 0
Projects 0
Wiki
Insights
PS4-and-Extra-Credit/PS4.do
1eb6cf4 33 minutes ago
@GabbyMora GabbyMora Add files via upload
90 lines (62 sloc) 2.66 KB
***********************//////////Gabby Mora////////////************************************************

/////////*Problem Set 4*//////
////////*Data Management*/////
////////*Fall 2017*//////////

---------------------------------------------------------------------------------------------------------------------
*********************************************************************************************************************
---------------------------------------------------------------------------------------------------------------------
Macros and Loops
---------------------------------------------------------------------------------------------------------------------
*********************************************************************************************************************
---------------------------------------------------------------------------------------------------------------------

import excel "https://docs.google.com/uc?id=0BywXSn44t-HlS19LS0Z1cnVoQkE&export=download", firstrow clear

set more off


ta Descr, plot
ta  LocationType 

display r(varlist)

local subset if e(unspecified)

ta LocationType, rename(unspecified) //this command doesnt work

//this whole thing should be commented out eg sth like this
/*
          // Location Type |      Freq.     Percent        Cum.
---------------------------+-----------------------------------
                Commercial |          2        0.32        0.32
           House and Store |          3        0.47        0.79
           Park/Playground |         14        2.21        3.00
      Residential Building |         18        2.84        5.84
Residential Building/House |        379       59.78       65.62
          Store/Commercial |         52        8.20       73.82
           Street/Sidewalk |        166       26.18      100.00
---------------------------+-----------------------------------
                     Total |        634      100.00//
*/

reg LocationType

drop UniqueKey

drop CreatedDate

drop ClosedDate

cap program drop CrueltyLoop
program define CrueltyLoop 
loc vName `1'  //Descr
cap drop `vName'N
encode `vName', gen(`vName'N)
ta `vName'N
hist `vName'N, percent  discrete xla(1/`r(r)', valuelabel noticks angle(vertical)) title($S_TIME  $S_DATE)
 //graph bar DescrN
end
 
 
CrueltyLoop LocationType //ok, but wonder why is it called cruelty loop?
 
d
replace CrossStreet1=lower(CrossStreet1)

ds, has(type str#)
foreach v of varlist `r(varlist)'{
replace `v'=lower(`v')
}

ds, has(type str#)
foreach v of varlist `r(varlist)'{
replace `v'="." if `v'=="unspecified"
}

ds, has(type str#)
foreach v of varlist `r(varlist)'{
destring `v',replace
}

e

CrueltyLoop LocationType 
 
d
replace FacilityType=lower(Facility)

replace SchoolName=(missing)

and need to substract say 3 points for late submission


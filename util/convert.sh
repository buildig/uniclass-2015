#!/usr/bin/env bash

# Download July 2017 version of xlsx files 
# (change version numbers to latest before launching this script!)

nbsurl="https://toolkit.thenbs.com/Articles/Classification/Uniclass2015Table/"
curl $nbsurl"Co?version=v1_3" > Uniclass2015_Co.xlsx &&
curl $nbsurl"En?version=v1_5" > Uniclass2015_En.xlsx &&
curl $nbsurl"Ac?version=v1_4" > Uniclass2015_Ac.xlsx &&
curl $nbsurl"SL?version=v1_5" > Uniclass2015_SL.xlsx &&
curl $nbsurl"EF?version=v1_2" > Uniclass2015_EF.xlsx &&
curl $nbsurl"Ss?version=v1_7" > Uniclass2015_Ss.xlsx &&
curl $nbsurl"Pr?version=v1_7" > Uniclass2015_Pr.xlsx &&
curl $nbsurl"TE?version=v1_2" > Uniclass2015_TE.xlsx &&
curl $nbsurl"Zz?version=v1_0" > Uniclass2015_Zz.xlsx &&
curl $nbsurl"FI?version=v0_1" > Uniclass2015_FI.xlsx &&
curl $nbsurl"PM?version=v0_1" > Uniclass2015_PM.xlsx

# Convert xlsx files to csv format

for i in *.xlsx;
 do
  filename=$(basename "$i" .xlsx);
  outext=".csv"
  in2csv $i | tail -n +3 > $filename$outext
done

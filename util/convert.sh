#!/usr/bin/env bash

# Download October 2017 version of xlsx files 
# (change version numbers to latest before launching this script!)

nbsurl="https://toolkit.thenbs.com/Articles/Classification/Uniclass2015Table/"
curl $nbsurl"Co?version=v1_4" > Uniclass2015_Co.xlsx &&
curl $nbsurl"En?version=v1_6" > Uniclass2015_En.xlsx &&
curl $nbsurl"Ac?version=v1_4" > Uniclass2015_Ac.xlsx &&
curl $nbsurl"SL?version=v1_6" > Uniclass2015_SL.xlsx &&
curl $nbsurl"EF?version=v1_2" > Uniclass2015_EF.xlsx &&
curl $nbsurl"Ss?version=v1_8" > Uniclass2015_Ss.xlsx &&
curl $nbsurl"Pr?version=v1_8" > Uniclass2015_Pr.xlsx &&
curl $nbsurl"TE?version=v1_3" > Uniclass2015_TE.xlsx &&
curl $nbsurl"Zz?version=v1_0" > Uniclass2015_Zz.xlsx &&
curl $nbsurl"FI?version=v0_1" > Uniclass2015_FI.xlsx &&
curl $nbsurl"PM?version=v1_0" > Uniclass2015_PM.xlsx

# Convert xlsx files to csv format

for i in *.xlsx;
 do
  filename=$(basename "$i" .xlsx);
  outext=".csv"
  in2csv $i | tail -n +3 > $filename$outext
done

# Download Uniclass2015_Tables.csv

curl -O "https://raw.githubusercontent.com/buildig/uniclass-2015/master/Uniclass2015_Tables.csv"

# Create Uniclass2015.csv

uniclassfiles="Uniclass2015_Tables.csv Uniclass2015_Ac.csv Uniclass2015_Co.csv Uniclass2015_EF.csv
Uniclass2015_En.csv Uniclass2015_FI.csv Uniclass2015_PM.csv Uniclass2015_Pr.csv
Uniclass2015_SL.csv Uniclass2015_Ss.csv Uniclass2015_TE.csv Uniclass2015_Zz.csv"

(head -1 Uniclass2015_Tables.csv;
  for i in $uniclassfiles;
    do tail -n +2 $i;
  done
) > Uniclass2015.csv

#!/usr/bin/env bash
set -exu

# Remove old *.csv files
rm *.csv
cp -a Uniclass2015_Tables.csv.txt Uniclass2015_Tables.csv

# Download July 2019 version of xlsx files
# (change version numbers to latest before launching this script!)
nbsurl="https://www.thenbs.com/-/media/uk/files/xls/uniclass/2019-07/"
curl $nbsurl"uniclass2015_co_v1_8.xlsx" > Uniclass2015_Co.xlsx
curl $nbsurl"uniclass2015_en_v1_13.xlsx" > Uniclass2015_En.xlsx
curl $nbsurl"uniclass2015_ac_v1_10.xlsx" > Uniclass2015_Ac.xlsx
curl $nbsurl"uniclass2015_sl_v1_13.xlsx" > Uniclass2015_SL.xlsx
curl $nbsurl"uniclass2015_ef_v1_6.xlsx" > Uniclass2015_EF.xlsx
curl $nbsurl"uniclass2015_ss_v1_15.xlsx" > Uniclass2015_Ss.xlsx
curl $nbsurl"uniclass2015_pr_v1_15.xlsx" > Uniclass2015_Pr.xlsx
curl $nbsurl"uniclass2015_te_v1_6.xlsx" > Uniclass2015_TE.xlsx
curl $nbsurl"uniclass2015_pm_v1_5.xlsx" > Uniclass2015_PM.xlsx
curl $nbsurl"uniclass2015_zz_v1_0.xlsx" > Uniclass2015_Zz.xlsx
curl $nbsurl"uniclass2015_fi_v1_1.xlsx" > Uniclass2015_FI.xlsx
curl $nbsurl"uniclass2015_ro_v1_1.xlsx" > Uniclass2015_Ro.xlsx

# Convert xlsx files to csv format

for i in *.xlsx;
 do
  filename=$(basename "$i" .xlsx);
  outext=".csv"
  in2csv $i | tail -n +3 > $filename$outext
done

# Create Uniclass2015.csv
uniclassfiles="Uniclass2015_Tables.csv Uniclass2015_Ac.csv Uniclass2015_Co.csv Uniclass2015_EF.csv
Uniclass2015_En.csv Uniclass2015_FI.csv Uniclass2015_PM.csv Uniclass2015_Pr.csv
Uniclass2015_SL.csv Uniclass2015_Ss.csv Uniclass2015_TE.csv Uniclass2015_Zz.csv Uniclass2015_Ro.csv"

(head -1 Uniclass2015_Tables.csv;
  for i in $uniclassfiles;
    do tail -n +2 $i;
  done
) > Uniclass2015.csv

# Remove *.xlsx files
rm *.xlsx

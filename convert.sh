#!/usr/bin/env bash
set -exu

# Remove old *.csv files
rm *.csv
cp -a Uniclass2015_Tables.csv.txt Uniclass2015_Tables.csv

# Download October 2020 version of xlsx files
# (change version numbers to latest before launching this script!)
curl "https://www.thenbs.com/-/media/uk/files/xls/uniclass/2020-10/uniclass2015_co_v1_11.xlsx" > Uniclass2015_Co.xlsx
curl "https://www.thenbs.com/-/media/uk/files/xls/uniclass/2020-10/uniclass2015_en_v1_18.xlsx" > Uniclass2015_En.xlsx
curl "https://www.thenbs.com/-/media/uk/files/xls/uniclass/2020-10/uniclass2015_ac_v1_12.xlsx" > Uniclass2015_Ac.xlsx
curl "https://www.thenbs.com/-/media/uk/files/xls/uniclass/2020-10/uniclass2015_sl_v1_18.xlsx" > Uniclass2015_SL.xlsx
curl "https://www.thenbs.com/-/media/uk/files/xls/uniclass/2020-01/uniclass2015_ef_v1_7.xlsx" > Uniclass2015_EF.xlsx
curl "https://www.thenbs.com/-/media/uk/files/xls/uniclass/2020-10/uniclass2015_ss_v1_20.xlsx" > Uniclass2015_Ss.xlsx
curl "https://www.thenbs.com/-/media/uk/files/xls/uniclass/2020-10/uniclass2015_pr_v1_20.xlsx" > Uniclass2015_Pr.xlsx
curl "https://www.thenbs.com/-/media/uk/files/xls/uniclass/2020-01/uniclass2015_te_v1_7.xlsx" > Uniclass2015_TE.xlsx
curl "https://www.thenbs.com/-/media/uk/files/xls/uniclass/2020-10/uniclass2015_pm_v1_10.xlsx" > Uniclass2015_PM.xlsx
curl "https://www.thenbs.com/-/media/uk/files/xls/uniclass/2020-01/uniclass2015_zz_v1_0.xlsx" > Uniclass2015_Zz.xlsx
curl "https://www.thenbs.com/-/media/uk/files/xls/uniclass/2020-01/uniclass2015_fi_v1_3.xlsx" > Uniclass2015_FI.xlsx
curl "https://www.thenbs.com/-/media/uk/files/xls/uniclass/2020-10/uniclass2015_ro_v1_3.xlsx" > Uniclass2015_Ro.xlsx

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

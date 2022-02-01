#!/usr/bin/env bash
set -exu
URL="https://www.thenbs.com/-/media/uk/files/xls/uniclass/2022-01/uniclass2015"
rm -rf uniclass2015
mkdir -p uniclass2015
cp -a Uniclass2015_Tables.csv.txt Uniclass2015_Tables.csv

# Download January 2022 version of xlsx files
# Change "$URL" & file names to the latest before launching this script!
curl ""$URL"_co_v1_15.xlsx" > Uniclass2015_Co.xlsx
curl ""$URL"_en_v1_23.xlsx" > Uniclass2015_En.xlsx
curl ""$URL"_ac_v1_16.xlsx" > Uniclass2015_Ac.xlsx
curl ""$URL"_sl_v1_22.xlsx" > Uniclass2015_SL.xlsx
curl ""$URL"_ef_v1_10.xlsx" > Uniclass2015_EF.xlsx
curl ""$URL"_ss_v1_25.xlsx" > Uniclass2015_Ss.xlsx
curl ""$URL"_pr_v1_25.xlsx" > Uniclass2015_Pr.xlsx
curl ""$URL"_te_v1_11.xlsx" > Uniclass2015_TE.xlsx
curl ""$URL"_pm_v1_15.xlsx" > Uniclass2015_PM.xlsx
curl ""$URL"_fi_v1_4.xlsx" > Uniclass2015_FI.xlsx
curl ""$URL"_ro_v1_5.xlsx" > Uniclass2015_Ro.xlsx
curl ""$URL"_zz_v1_1.xlsx" > Uniclass2015_Zz.xlsx

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

mv *.csv uniclass2015
# Remove *.xlsx files
rm *.xlsx

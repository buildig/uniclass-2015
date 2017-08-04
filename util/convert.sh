#!/usr/bin/env bash

# convert xlsx to csv
# tail example: https://github.com/wireservice/csvkit/issues/336#issuecomment-56042714

for i in *.xlsx;
 do
  filename=$(basename "$i" .xlsx);
  outext=".csv"
  in2csv $i | tail -n +3 > $filename$outext
done

# remove versioning information from csv filenames
# https://askubuntu.com/a/481848

for i in *.csv
do
  newname="$(echo $i|cut -d_ -f1,2).csv";
  cp $i $newname
done

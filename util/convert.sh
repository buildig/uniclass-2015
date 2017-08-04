#!/usr/bin/env bash

for i in *.xlsx;
 do
  filename=$(basename "$i" .xlsx);
  outext=".csv" 
  in2csv $i > $filename$outext
done

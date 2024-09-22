#!/bin/bash

wget https://s3.amazonaws.com/ds2002-resources/labs/lab3-bundle.tar.gz
tar -xvzf lab3-bundle.tar.gz
awk '!/^[[:space:]]*$/' lab3_data.tsv > cleaned_lab3_data.tsv
tr '\t' ',' < cleaned_lab3_data.tsv > lab3_data.csv
line_count=$(($(wc -l < lab3_data.csv) - 1))
echo "Number of non-empty lines excluding the header: $line_count"
tar -czvf converted-archive.tar.gz lab3_data.csv
echo "Converted archive created as converted-archive.tar.gz"


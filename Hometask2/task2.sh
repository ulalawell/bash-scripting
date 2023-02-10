#!/bin/bash

mkdir -p 'datasets/csv'
mkdir -p 'datasets/txt'

pip install -r requirements.txt 


for i in 1 2 3 4 5 6 7 8 9
do 
       (if [ ! -f "datasets/txt/a${i}a" ]
	then
		echo "a${i}a is downloading"
		nohup wget -O "datasets/txt/a${i}a"  "https://www.csie.ntu.edu.tw/~cjlin/libsvmtools/datasets/binary/a${i}a" > info.txt 
	fi

	echo "a${i}a downloaded and now is reading"

	python3 parse_csv.py "datasets/txt/a${i}a" "datasets/csv/a${i}a.csv" 

	echo "a${i}a is read") &
done
wait
  
Echo "all files downloaded"
#!/bin/bash

if [ $# -ne 1 ]  
	then 
	    echo "Usage ./hw1.sh MAXPOINTS"
	    exit 1
	else 
	   declare -i MAXPOINTS=$1	
fi

echo "Maximum score $MAXPOINTS"

for student_dir in $(pwd)/students/*
 do
	student_name="$(echo $student_dir | awk -F/ '{print $NF}')"
	echo "Processing $student_name ..."

	if [ -f "$student_dir/task1.sh" ]
	     then
 
	         . "$student_dir/task1.sh" > temp_file.txt
	        declare -i incorrect_lines="$(diff -w  "$(pwd)/expected.txt"  temp_file.txt | grep -E '<|>' | wc -l)"
		declare -i student_score="$MAXPOINTS - $incorrect_lines * 5"

		 if [ $incorrect_lines -eq 0 ]
	             then
		         echo "$student_name has correct output"
		     else
			 echo "$student_name has incorrect output ($incorrect_lines lines do not match)"
		 fi

		 if [ $student_score -lt 0 ]
		     then
			 student_score=0
		 fi

		 echo "$student_name has earned a score of $student_score / $MAXPOINTS"
	    else
	         echo "$student_name did not turn in the assignment"
	fi 
	echo ""
 done

rm temp_file.txt

#!/bin/bash

format(){
	for file in $1
	do
		if [ -f $file ] && [[ $file == *.c || $file == *.h ]]
		then
			echo "formating : $file"
			clang-format -i $file
		fi

		if [ -d $file ]
		then
			echo "we enter the directory $file"
			format "$file/*"
			echo "we quit the directory $file"
		fi
	done
}

format $1

#!/bin/bash

format(){
	local path=$1
	echo "we enter the directory $path"
	for file in $path
	do
		if [ -f $file ] && [[ $file == *.c || $file == *.h ]]
		then
			echo "formating : $file"
			clang-format -i $file
		fi

		if [ -d $file ]
		then
			format "$file/*"
		fi
	done
	echo "we quit the directory $path"
}

if [[ $1 == -h || $1 == --help ]]
then
	echo "usage : cformat <path>"
elif [ $1 ]
then
	format $1
else
	format "."
fi

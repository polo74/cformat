#!/bin/bash

check_clang(){
        local clang_exist=0
        for i in $(echo $PATH | tr ":" "\n")
        do
                if [ -f "$i/clang-format" ]
                then
                        clang_exist=1
                fi
        done
        if [ $clang_exist = 0 ]
        then
                echo "Please install clang format!"
                exit -1
        fi
}

format(){
	local path=$1
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
}

check_clang

if [[ $1 == -h || $1 == --help ]]
then
	echo "usage : cformat <path>"
elif [ $1 ]
then
	format $1
else
	format "."
fi

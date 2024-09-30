#!/bin/bash

file=$(echo $1 | rev | cut -d '/' -f 1 | rev)
dir=$(echo $1 | rev | cut -d '/' -f 2- | rev)
bin_folder=$2

function go_back() {
	file=$(echo $dir | rev | cut -d '/' -f 1 | rev)/$file
	dir=$(echo $dir | rev | cut -d '/' -f 2- | rev)
}

# file=$(echo $1 | sed 's/\/src\//;/g' | cut -d ';' -f 2)
# dir=$(echo $1 | sed 's/\/src\//;/g' | cut -d ';' -f 1)
zut_file=~/emacs-config/zut.txt

function find_makefile() {
	while ! [ -f $dir/Makefile ] && [ -d $dir ] && [ ${#dir} -gt 0 ]
	do
		go_back
	done
}

function exec_make() {
	if [ -f $dir/Makefile ]
	then
		#echo $dir
		#echo $file
		#echo $(echo $file | sed 's/\.java$/\.class/' | sed 's/src/bin/')
		make -C $dir $(echo $file | sed 's/\.java$/\.class/' | sed "s/src/$bin_folder/") 2> $zut_file > /dev/null
		#javac -encoding iso-8859-1 -d $dir/bin/ -cp $dir/src/ $dir/src/$file 2> $zut_file > /dev/null
		cat $zut_file | grep $file | cut -d ':' -f 2 | uniq
		exit
	fi
}

#echo $file
#echo $dir
find_makefile
exec_make #$dir

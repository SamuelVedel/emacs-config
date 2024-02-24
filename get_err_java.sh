#!/bin/bash

# file=$(echo $1 | rev | cut -d '/' -f 1 | rev)
# dir=$(echo $1 | rev | cut -d '/' -f 2- | rev)

# function go_back() {
# 	file=$(echo $dir | rev | cut -d '/' -f 1 | rev)/$file
# 	dir=$(echo $dir | rev | cut -d '/' -f 2- | rev)
# }

file=$(echo $1 | sed 's/\/src\//;/g' | cut -d ';' -f 2)
dir=$(echo $1 | sed 's/\/src\//;/g' | cut -d ';' -f 1)
zut_file=~/emacs-config/zut.txt

function exec_make() {
	if [ -f $1/Makefile ]
	then
		#echo $dir
		#echo $file
		#make -C $1 $(echo $file | sed 's/.java/.class/') 2> $zut_file > /dev/null
		javac -encoding iso-8859-1 -d $dir/bin/ -cp $dir/src/ $dir/src/$file 2> $zut_file > /dev/null
		cat $zut_file | grep /$file | cut -d ':' -f 2 | uniq
		exit
	fi
}

#echo $file
#echo $dir
exec_make $dir

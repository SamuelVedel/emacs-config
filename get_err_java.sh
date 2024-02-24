#!/bin/bash

# file=$(echo $1 | rev | cut -d '/' -f 1 | rev)
# dir=$(echo $1 | rev | cut -d '/' -f 2- | rev)

# function go_back() {
# 	file=$(echo $dir | rev | cut -d '/' -f 1 | rev)/$file
# 	dir=$(echo $dir | rev | cut -d '/' -f 2- | rev)
# }

file=$(echo $1 | sed 's/\/src\//;/g' | cut -d ';' -f 2)
dir=$(echo $1 | sed 's/\/src\//;/g' | cut -d ';' -f 1)

function exec_make() {
	if [ -f $1/Makefile ]
	then
		#echo $dir
		#echo $file
		#make -C $1 $(echo $file | sed 's/.java/.class/') 2> zut.txt > /dev/null
		javac -encoding iso-8859-1 -d $dir/bin/ -cp $dir/src/ $dir/src/$file 2> zut.txt > /dev/null
		cat zut.txt | grep /$file | cut -d ':' -f 2
		exit
	fi
}

#echo $file
#echo $dir
exec_make $dir

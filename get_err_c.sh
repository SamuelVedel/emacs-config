#!/bin/bash

file=$(echo $1 | rev | cut -d '/' -f 1 | rev)
dir=$(echo $1 | rev | cut -d '/' -f 2- | rev)
zut_file=~/emacs-config/zut.txt

function go_back() {
	#file=$(echo $dir | rev | cut -d '/' -f 1 | rev)/$file
	dir=$(echo $dir | rev | cut -d '/' -f 2- | rev)
}

function exec_make() {
	if [ -f $1/Makefile ]
	then
		#echo $file
		make -C $1 $(echo $file | sed 's/.c$/.o/') 2> $zut_file > /dev/null
		cat $zut_file | grep /$file | cut -d ':' -f 2 | uniq | grep "^[0-9]*$"
		exit
	fi
}

while [ ${#dir} -gt 0 ]
do
	exec_make $dir
	go_back
done
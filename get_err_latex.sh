#!/bin/bash

config_path=$(echo $0 | rev | cut -d '/' -f 2- | rev)
file=$2
if [ $file = "null" ]
then
	file=$(echo $1 | rev | cut -d '/' -f 1 | rev)
fi
dir=$(echo $1 | rev | cut -d '/' -f 2- | rev)
zut_file=$config_path/zut.txt

function go_back() {
	dir=$(echo $dir | rev | cut -d '/' -f 2- | rev)
}

function find_makefile() {
	while ! [ -f $dir/Makefile ] && [ -d $dir ]
	do
		go_back
	done
}

function exec_make() {
	if [ -f $dir/Makefile ]
	then
		make -C $dir 2> $zut_file > $zut_file
	fi
}

if [ $file != "Makefile" ]
then
	cd $dir
	pdflatex -halt-on-error $file 2> $zut_file > $zut_file && pdflatex -halt-on-error $file 2> /dev/null > /dev/null #&& $(evince $(echo $file | sed "s/\.tex/\.pdf/") &)
else
	find_makefile
	exec_make
fi

cat $zut_file | grep "^l.[1-9]* " | cut -d '.' -f 2 | cut -d ' ' -f 1

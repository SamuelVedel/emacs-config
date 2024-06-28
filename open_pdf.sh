#!/bin/bash

# first arg: the path of the file that call this script
# second arg: the name of the main file (can be null)

file=$2
dir=$(echo $1 | rev | cut -d '/' -f 2- | rev)
if [ $file = "null" ]
then
	file=$1
fi

function go_back() {
	dir=$(echo $dir | rev | cut -d '/' -f 2- | rev)
}

function find_makefile() {
	while ! [ -f $dir/Makefile ] && [ -d $dir ]
	do
		go_back
	done
}

if [ $file != "Makefile" ]
then
	evince $(echo $file | sed "s/\.tex/\.pdf/")
else
	find_makefile
	make -C $dir show
fi

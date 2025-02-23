#!/bin/bash

config_path=$(echo $0 | rev | cut -d '/' -f 2- | rev)
file=$(echo $1 | rev | cut -d '/' -f 1 | rev)
dir=$(echo $1 | rev | cut -d '/' -f 2- | rev)
zut_file=$config_path/zut.txt
bin_file=$2

function show_lines_with_errors() {
	cat $zut_file | grep "\(^\|/\)$file" | cut -d ':' -f 2 | uniq | grep "^[0-9]*$"
}

if [ "$bin_file" == "null" ]
then
	g++ -std=c++11 -c -Wall -Wextra -fsyntax-only $1 2> $zut_file > /dev/null
	show_lines_with_errors
	exit
fi

function go_back() {
	#file=$(echo $dir | rev | cut -d '/' -f 1 | rev)/$file
	dir=$(echo $dir | rev | cut -d '/' -f 2- | rev)
}

function exec_make() {
	if [ -f $1/Makefile ]
	then
		make -C $1 $bin_file$(echo $file | sed 's/.cpp$/.o/') 2> $zut_file > /dev/null
		show_lines_with_errors
		exit
	fi
}

while [ ${#dir} -gt 0 ]
do
	exec_make $dir
	go_back
done

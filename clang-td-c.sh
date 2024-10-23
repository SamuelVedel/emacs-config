#!/bin/bash

config_path=$(echo $0 | rev | cut -d '/' -f 2- | rev)
total_path=$1
zut_file=$config_path/zut.txt
arg=$2

clang-tidy $total_path -- $arg 2> $zut_file > $zut_file
cat $zut_file | grep "\(^\|/\)$file" | cut -d ':' -f 2 | grep "^[0-9]*$" | uniq

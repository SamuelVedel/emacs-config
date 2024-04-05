#!/bin/bash

total_path=$1
zut_file=~/emacs-config/zut.txt
arg=$2

clang-tidy $total_path -- $arg 2> $zut_file > $zut_file
cat $zut_file | grep "\(^\|/\)$file" | cut -d ':' -f 2 | grep "^[0-9]*$" | uniq

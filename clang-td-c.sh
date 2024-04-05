#!/bin/bash

total_path=$1
zut_file=~/emacs-config/zut.txt

clang-tidy $total_path -- Ihash 2> $zut_file > $zut_file
cat $zut_file | grep "\(^\|/\)$file" | cut -d ':' -f 2 | uniq | grep "^[0-9]*$"

#!/bin/bash

config_path=$(echo $0 | rev | cut -d '/' -f 3- | rev)
file=$(echo $1 | rev | cut -d '/' -f 1 | rev)
dir=$(echo $1 | rev | cut -d '/' -f 2- | rev)
zut_file=$config_path/zut.txt

cd $dir
npx tsc --noEmit --allowJs $file 2> $zut_file > $zut_file

cat $zut_file | grep "^$file([1-9]" | cut -d '(' -f 2 | cut -d ',' -f 1 | uniq

#!/bin/bash

file=$(echo $1 | rev | cut -d '/' -f 1 | rev)
folder=$(echo $1 | rev | cut -d '/' -f 2- | rev)
zut_file=~/emacs-config/zut.txt

cd $folder
pdflatex -halt-on-error $file 2> $zut_file > $zut_file && pdflatex -halt-on-error $file 2> /dev/null > /dev/null #&& $(evince $(echo $file | sed "s/\.tex/\.pdf/") &)

cat $zut_file | grep "^l.[1-9]* " | cut -d '.' -f 2 | cut -d ' ' -f 1

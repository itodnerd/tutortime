#!/bin/bash
my_dir=`dirname $0`
# read general config from file
source $my_dir/config.sh

for file in $(ls $log_dir)
do
	./scripts/TeXextractor.sh $log_dir/$file $datafile $timefile $monthfile
	latexmk Ausgabe.tex --pdf -jobname=tmp/$file
	mv tmp/$file.pdf Ausgaben/.
done


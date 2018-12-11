#!/bin/bash
my_dir=`dirname $0`
# read general config from file
source $my_dir/scripts/config.sh

rm -rf $log_dir &>/dev/null
rm -rf tmp
rm -rf Ausgaben
mkdir tmp
mkdir $log_dir
mkdir Ausgaben
cp $log_files $log_dir/.
./scripts/convertAll.sh

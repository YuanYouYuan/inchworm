#! /usr/bin/env sh
for file in *.csv; do 
	cat $file | tr -d '[]' | sed '/__/d' | sort > tmp
	mv tmp $file
done

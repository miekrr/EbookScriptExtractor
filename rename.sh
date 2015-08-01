#!/bin/bash

for dir in `cat files`
do
	cd $dir
	name=$dir".pdf"
	for file in `ls *.pdf`
	do
		mv $file $name	
	done	
	cd ..
done

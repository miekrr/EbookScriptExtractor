#!/bin/bash

for dir in `cat files`
do
	cd $dir
	for file in `ls *.rar`
	do
		unrar e -y $file
	done 
	cd ..
done

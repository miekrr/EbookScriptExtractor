#!/bin/bash

for dir in `cat files`
do
	cd $dir
	mv *.pdf ..
	cd ..
done

#!/bin/bash

ls -p | grep / |sed s:/:: > files

while read dir
do 

	cd "$dir"
	name=$dir".zip"
	echo $name
	7z a -tzip "$name" *.jpg *.png 1>/dev/null
	mv *.zip ..
	cd ..

done < "files"
echo $a;

rm files
echo "Final line count is: $a";

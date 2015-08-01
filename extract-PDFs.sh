#!/bin/bash

ls -p | grep / |sed s:/:: > files

while read dir
do
	cd "$dir"
	
	for file in `ls *.zip`
	do
		unzip -n $file 1>/dev/null
	done 
	echo $dir
	rarcount=`ls -m1 *.rar | wc -l`
	#echo $rarcount
	if [ $rarcount -gt 0 ];#-a *.rar ];
		then
		for file in `ls -m1 *.rar | head -1`
		do
			7z e -y "$file" 1>/dev/null
			#echo "Unraring file"
		done 
	elif [ -a *.001 ]
		then
		filer=`ls *.001`
		7z e -y $filer 1>/dev/null
	else
		echo "ERROR FINDING RAR FILES in folder " $dir " !!!"
	fi
	pdfcount=`ls *.pdf | wc -l`
	if  [ $pdfcount -gt 0 ];
		then
		if [ $pdfcount -eq 1 ]
		then
			#echo "pre move"
			name=$dir".pdf"
			file=`ls *.pdf`
			if [ "$name" != "$file" ]
				then
				mv "$file" "$name" 1>/dev/null
			fi
			#echo "move pdf .."
			#ls -m1 *.pdf
			mv *.pdf .. 1>/dev/null
			#echo "moving folder"
			#echo "name " + $name + " filename " + $file
		else 
			mv *.pdf .. 1>/dev/null
		fi
	else
		echo "No PDF FILES!"
	fi
	
	if  [ -a *.mobi ];
		then
		name=$dir".mobi"
		file=`ls *.mobi`
		mv $file $name 1>/dev/null
		mv *.mobi .. 1>/dev/null
	fi

	if  [ -a *.epub ];
		then
		name=$dir".epub"
		file=`ls *.epub`
		mv $file $name 1>/dev/null
		mv *.epub .. 1>/dev/null
	fi
	
	cd ..
		
done < files
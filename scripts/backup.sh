#!/bin/bash
# scriptname: backup.sh
# purpose: create backup files and store
# them in a backup directory
#
# global declarations
dir=$HOME/backups
for file in *
do 
	if [ -f $file ]
	then
		cp $file $dir/$file.bak
		echo "$file is backed up in $dir"
		((count+=1))
	fi
echo $count backups complete
done

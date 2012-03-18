#!/bin/bash
# scriptname: project1.sh
# Author: Irissa (Nikki) Everett
# n.everett@gmail.com

# count the number of positional params.
# if none, exit with error
# if one, set dirname to the parameter
# if two, check that the first is a -f flag 
# and set dirname to the second.
args=$#
case $args in
0)	
	echo "Usage: $0 [-f] directory_name"
	exit 1
	;;
1)
	dirname=$1
	;;
2)
	if [[ $1 = '-f' ]]
	then
		autodelete=true
		dirname=$2
	fi
	;;
*)	
	echo "Usage: $0 [-f] directory_name"
	exit 2
esac

# get the full path of the provided directory
dirpath=`find / -name $dirname -type d 2> /dev/null`

# If the dirpath is empty, it means the directory doesn't exist or is not accessible
# Exit the script and ask for a valid directory. 
# If the dirpath does exist, get the names of the empty files.  
if [[ $dirpath = "" ]] 
then
	echo "$dirname does not exist. Please run $0 with an existing directory"
	exit 1
else	
	declare -a filenames
	filenames=`find $dirpath -empty -exec ls {} \;`
fi

# If there are no files in the directory, exit the script. 
if [[ $filenames = "" ]]
then
	echo "No files in $dirname. Exiting script"
	exit 0
fi

# if the autodelete flag is set, delete the files without prompting
# otherwise, prompt before deleting each file.
if [[ $autodelete ]]
then
	printf "Deleting the following empty files:\n" 
	echo "${filenames[*]}"
	for filename in $filenames
	do
		rm $filename
	done
	echo "All empty files deleted." 
else
	for filename in $filenames
	do 
		echo "Delete $filename? y/n"
		read answer	
		case $answer in
		[Yy])
			rm $filename
			;;
		[Nn])
			echo "Not deleting $filename"
			;;
		*)
			echo "Please use Y/N or y/n"
			;;
		esac
	done
fi	

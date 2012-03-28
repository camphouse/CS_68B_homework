#!/bin/bash
# scriptname: lab5.sh
# Author: Irissa (Nikki) Everett
# n.everett@gmail.com

args=$#
case $args in
0)
	echo "Usage $0 [-f] filename"
	exit 1
	;;
1)
	filename=$1
	;;
2)
	if [[ $1 = '-f' ]]
	then
		autodelete=true
		filename=$2
	fi
	;;
*)
	echo "Usage: $0 [-f] filename"
	exit 2
esac

if [[ ! -f $filename ]]
then
	echo "$filename does not exist"
	exit 3 
fi

if [[ $autodelete && -f $filename ]]
then
	echo "Deleting $filename"
	rm $filename
elif [[ -f $filename ]]
then
	echo "Delete? Y for yes, N for no"
	read answer
	case $answer in
	[Yy])
		echo "Deleting $filename"
		rm $filename
		;;
	[Nn])
		echo "Ok, I won't delete $filename"
	esac
fi	
	



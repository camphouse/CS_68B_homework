#!/bin/bash
# scriptname: opts3
# using getopts 
#
while getopts dq: options
do
	case $options in 
		d) echo "you entered -d as an option";;
		q) echo "the argument for -q is $OPTARG";;
		\?) echo "usage: opts3 -dq filename..." 1>&2;;
	esac
done

#!/bin/bash
# scriptname: lab4.sh
# Author: Irissa (Nikki) Everett
# n.everett@gmail.com

mytest_dir=~/mytest

# if ~/mytest exsts, exit script
# otherwise, call lab3.sh to create the directory
if [ -d $mytest_dir ]
then 
	echo "mytest directory exists"
else
	./lab3.sh
	echo "created ~/mytest directory"
fi

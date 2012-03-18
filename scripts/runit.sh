#!/bin/bash
# scriptname: runit
PS3="Select a program to execute: "
select program in 'ls -F' pwd date cal exit
do 
	$program
done

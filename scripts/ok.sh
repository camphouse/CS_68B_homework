#!/bin/bash
# filename: ok.sh
shopt -s extglob # turns on extended pattern matching

echo "are you ok? (y/n)"
read answer
if [[ $answer = [Yy]* || $answer = [Mm]aybe ]] 
then
	echo "glad to hear it"
fi

if [[ $answer = [Nn]o?(way|t really) ]]
then 
	echo "So sorry"
fi

#!/bin/bash
until who | grep $1
do 
	echo waiting for $1
	sleep 10
done
echo "$1 has logged on"

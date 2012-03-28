#!/bin/bash
# scriptname: dater
# set positional parameters with the set command
# and shift through the parameters
set $(date)
while (( $# > 0 ))
do
	echo $1
	shift
done

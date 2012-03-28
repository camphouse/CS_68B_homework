#!/bin/bash
# scriptname: permx.sh
# takes files as positional parameters
# execute permission is added to each file
for file
do
	if [[ -f $file &&! -x $file ]]
	then
		chmod +x $file
		echo You may now execute $file
	fi
done

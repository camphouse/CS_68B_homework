#!/bin/bash
# scriptname: mailer.sh
for person in $(cat mylist)
do
	mail $person < letter
	echo $person has been sent a letter.
done
echo "the letter has been sent"

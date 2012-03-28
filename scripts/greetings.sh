#!/bin/bash
# This script greets the user and displays information about
# the user's environment.
# written by: Irissa (Nikki) Everett
# n.everett@gmail.com
# Global Declarations
declare answer
declare -a friends
declare -i num=40

# case structure
hour=$(date +%H)
case "$hour" in
0? | 1[01] ) echo "Good morning";;
1[2-7]     ) echo "Good afternoon";;
*          ) echo "Good evening";;
esac

# Greet the user and display information about the user's
# environment.
echo "Hello $LOGNAME, it's nice to see you in the land of Linux."
echo "Your current directory is $(pwd)."
echo "You are working on a computer called $(uname -n)."
echo "Here is a long list of your files."
ls -l # list of files in the present working directory

#  checks to see if root is logged on.
 declare name="root"
who | grep "^$name " > /dev/null && echo "$name is logged on" \
|| echo "$name is not logged on"

# use the if statement to test whether the /etc/passwd exists
if [ -e /etc/passwd ]; 
then      # /etc/passwd file exists: go to nested if statement
  if grep "$LOGNAME" /etc/passwd >& /dev/null; then
     echo "Your login was found in the passwd file."
  else    # username not found
     echo "Your login was not found in the passwd file."
     exit 1
  fi      # end nested if statement and return to outer if
else      #/etc/passwd file does not exist
  echo "The passwd file was not found".
fi

# get information from the user and respond
echo -e "Do you like Linux? \c"
read answer
echo "$answer is the right response."

# Add 2 to the num variable and display results
((num+=2))
echo "The answer is $num"

# get the names of four friends from the user
echo -n "Name four friends?"
read -a friends
echo "Say hi to ${friends[3]}"

# display the name of the script and the date
echo "This script is named $0"
set $(date) # reset positional parameters
echo "The date is $2 $3, $6"
echo "Bye for now $LOGNAME.  The time is $(date +%T)!"

# Cleanup
exit 0 # all is well


#!/bin/bash
# This script greets the user and displays information about
# the user's environment. 
# written by: Nikki Everett (n.everett@gmail.com)
#
# Global declarations:
#
declare name="root"
declare answer
declare -a friends
declare -i num=40

# Greet the user and display information about the user's environment
#
# case structure
hour=$(date +%H)
case "$hour" in
  0? | 1[01] ) echo "Good morning";;
  1[2-7]     ) echo "Good afternoon";;
  *          ) echo "Good evening";;
esac

echo "Hello $LOGNAME, it's nice to see you in the land of Linux."
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

#  checks to see if root is logged on.
who | grep "^$name " > /dev/null && echo "$name is logged on" \
 || echo "$name is not logged on"

echo "Your current directory is $(pwd)."
echo "You are working on a computer called $(uname -n)."
echo "Here is a long list of your files."
ls -l # list of files in the present working directory

# display the name of the script and the date 
echo "This script is named $0"
set $(date) # reset positional params
echo "The date is $2 $3, $6"

# get information from the user and respond
echo -e "Do you like Linux? \c"
read answer
echo "$answer is the right response."
echo -n "Name four friends?"
read -a friends
echo "Say hi to ${friends[3]}"

# Add 2 to the num variable and display results
num=$((num+2))

echo "The answer is $num"

echo "Bye for now, $LOGNAME. The time is $(date +%T)!"
#
# Cleanup
exit 0 # all is well


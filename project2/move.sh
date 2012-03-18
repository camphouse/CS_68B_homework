# Project 2
# CIS 068B W12
# Author: Nikki Everett
# n.everett@gmail.com
# move.sh: a script to move completed
# files into $HOME/completed/

# set up variables
declare -a files
dir=$HOME/completed/

# check positional parameters
# set files variable to $@
# if file(s) specified
if [ $# = 0 ];
then 
  echo "Usage: $0 [file1] [file2] ... [file n]"
  exit
else 
  files=$@ 
fi

# functions 
# first to test for 'completed' dir
# and create it if it doesn't exist
# second to move files function test_for_dir {
function test_for_dir {
  if [ ! -d $dir ]
  then
    echo "creating $dir"
    mkdir $dir
  fi
}

function move {
  echo "moving files: $files"
  mv $files $HOME/completed/
}

# check to see that directory exists
# if not, create it
test_for_dir $dir

# actually move the files
move $files

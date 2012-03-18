#!/bin/bash
# scriptname: lab6.sh
# author: irissa (nikki) everett
# n.everett@gmail.com
# finds all files in the 
# curent directory that have
# read, write, and execute permissions
# for all users (rwxrwxrwx)

ls -l | grep 'rwxrwxrwx'

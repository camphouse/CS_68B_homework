#!/bin.bash
#  scriptname: check_showmount.sh
remotes=$(/usr/sbin/showmount)
if [ "X${remotes}" != "X" ]
then
	/usr/sbin/wall ${remotes}
fi

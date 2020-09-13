#!/bin/bash

##########CONSTANTS

DIRECTORY_NAME="$1"


### MAIN #######
cd "$DIRECTORY_NAME" || exit

# Gathering all desired contents from log files and piping into extraction 

cat ./*var/log/* |\
	awk ' $6~/Failed/ && $9~/invalid/ {print $1, $2, $3, $11, $13}' \
	|sed -e 's/\:\(..\):\(..\)//g' > failed_login_data.txt

# second awk for failed login attempts

cat ./*var/log/* |\
	awk ' $6~/Failed/ && $10~/from/ {print $1, $2, $3, $9, $11}' \
	| sed -e 's/\:\(..\):\(..\)//g' >> failed_login_data.txt


cd "$HERE" || exit

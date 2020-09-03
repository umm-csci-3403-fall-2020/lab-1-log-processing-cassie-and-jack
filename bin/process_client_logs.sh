#!/bin/bash

######### CONSTANTS ######
CLIENT_DIRECTORY="$1"
######### MAIN #########

cd "$CLIENT_DIRECTORY" || exit
# Gathering all of the contents from the log files and piping them into extraction command
cat *var/log/* |\
	awk '/^([A-Za-z]+)/ && $6~/Failed/ && $9~/invalid/ {print $1, $2, $3, $11, $13}' \
	| sed -e 's/\:\(..\):\(..\)//g' > failed_login_data.txt

# awk for failed login attempts that are actual user names in the lab
cat *var/log/* |\
 	awk '/^([A-Za-z]+)/ && $6~/Failed/ && $10~/from/ {print $1, $2, $3, $9, $11}' \
	| sed -e 's/\:\(..\):\(..\)//g' >> failed_login_data.txt 


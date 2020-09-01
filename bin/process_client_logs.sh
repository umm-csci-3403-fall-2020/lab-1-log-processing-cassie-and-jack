#!/bin/bash

######### CONSTANTS ######
CLIENT_DIRECTORY="$1"
######### MAIN #########

cd "$CLIENT_DIRECTORY" || exit
# Gathering all of the contents from the log files and piping them into extraction command
cat var/log/* | awk  'match($0, /^([a-zA-Z]+)[ ]+([0-9]+ [0-9][0-9]):[0-9]+ [a-zA-Z]+ sshd\[[0-9]+\]:Failed password for[A-Za-z]* ([A-Zz-A_0-9]+) from ([0-9]+.[0-9]+.[0-9]+.[0-9]+)/,groups) {print groups[1], groups[2], groups[3], groups[4]}'  > failed_login_data.txt



#!/bin/bash
DIRECTORY_NAME=$1

cd "$DIRECTORY_NAME" || exit
ls
#cat */failed_login_data.txt \
	#| awk '/^([A-Za-z]+)/ && $6~/Failed/ && $9~/invalid/ {print $11}' > username_dist.html

cat testInput.txt \
	| sort -u | uniq -c > testOutput.txt

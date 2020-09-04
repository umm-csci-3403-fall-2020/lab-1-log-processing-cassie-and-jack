#!/usr/bin/env bash

#***********CONSTANTS
DIRECTORY_NAME=$1
HERE=$(pwd)
#************MAIN
cd "$DIRECTORY_NAME" || exit

# Extracting the appropriate column to grab the hour using awk
cat ./*/failed_login_data.txt \
	| awk ' {print $5} ' | sort > temp_country_IP.html
sort "$HERE"/etc/country_IP_map.txt
       	join -1 2 -2 2 temp_country_IP.html "$HERE"/etc/country_IP_map.txt > temp2_country_IP.html 
cat temp2_country_IP.html | awk '{print $2}' | sort | uniq -c\
	| awk ' { print "data.addRow( [\x27"$2"\x27, "$1"]);"}' \
	> temp_country_dist.html



# Using wrap contentssh to add footer and header to usernames
cd "$HERE" || exit

./bin/wrap_contents.sh "$DIRECTORY_NAME"/temp_country_dist.html html_components/country_dist \
	"$DIRECTORY_NAME"/country_dist.html

# Clean up temp files
#rm "$DIRECTORY_NAME"/temp_country_dist.html


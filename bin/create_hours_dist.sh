#!/bin/bash

#***********CONSTANTS                                                             
DIRECTORY_NAME=$1
HERE=$(pwd)

#************MAIN                                                                 
cd "$DIRECTORY_NAME" || exit

# Extracting the appropriate column to grab the hour using awk
# I am using $3 here judging by the readme on GitHub to grab the hour
# I assume that third field is the hour and not the year as the year would most
# Likely be in MM/DD/YYYY (USA) or YYYY/MM/DD (EU) format
cat ./*/failed_login_data.txt \
	| awk ' {print $3} ' | sort | uniq -c | awk ' { print "data.addRow( [\x27"$2"\x27, "$1"]);"}' \
	> temp_hours_dist.html

# Using wrap contentssh to add footer and header to usernames
cd "$HERE" || exit
./bin/wrap_contents.sh "$DIRECTORY_NAME"/temp_hours_dist.html html_components/hours_dist \
	"$DIRECTORY_NAME"/hours_dist.html

# clean up temp files                                                             
rm "$DIRECTORY_NAME"/temp_hours_dist.html 

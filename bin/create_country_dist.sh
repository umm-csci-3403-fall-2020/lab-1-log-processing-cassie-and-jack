#!/usr/bin/env bash

#***********CONSTANTS
DIRECTORY_NAME=$1
HERE=$(pwd)
#************MAIN
cd "$DIRECTORY_NAME" || exit

# Extracting the appropriate column to grab the hour using awk
cat ./*/failed_login_data.txt \
	| awk ' {print $5} ' | sort | uniq -c | awk ' { print "data.addRow( [\x27"$2"\x27, "$1"]);"}' \
	> country_codes.txt

# Iterating over the contents of country_codes.txt and calling geoiplookup
# to map the ip address to a country and using uniq to count the occurences
for p in $(country_codes.txt);
do
	geoiplookup p | uniq -c > temp_country_dist.html;
done

# Using wrap contentssh to add footer and header to usernames
cd "$HERE" || exit

./bin/wrap_contents.sh "$DIRECTORY_NAME"/temp_hours_dist.html html_components/hours_dist \
	"$DIRECTORY_NAME"/hours_dist.html

# Clean up temp files
rm "$DIRECTORY_NAME"/temp_hours_dist.html

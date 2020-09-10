
#***********CONSTANTS
DIRECTORY_NAME=$1
HERE=$(pwd) 
#************MAIN
cd "$DIRECTORY_NAME" || exit

# take the usernames from failed_login_data.txt, sort, and count occurances of each username
# second awk command then prints desired output into code that will create pie char
cat ./*/failed_login_data.txt \
	| awk ' {print $4} ' | sort | uniq -c | awk ' { print "data.addRow( [\x27"$2"\x27, "$1"]);"}' \
	> temp_username_dist.html

# Using wrap contentssh to add footer and header to usernames
cd "$HERE" || exit
./bin/wrap_contents.sh "$DIRECTORY_NAME"/temp_username_dist.html html_components/username_dist \
	"$DIRECTORY_NAME"/username_dist.html

# clean up temp files
rm "$DIRECTORY_NAME"/temp_username_dist.html





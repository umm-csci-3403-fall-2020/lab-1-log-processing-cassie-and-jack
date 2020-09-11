#!/bin/bash

DIRECTORY_NAME=$1
HERE=$(pwd)

 

cd "$DIRECTORY_NAME" || exit

cat country_dist.html hours_dist.html username_dist.html > temp_dist.html

cd "$HERE" || exit




bin/wrap_contents.sh "$DIRECTORY_NAME"/temp_dist.html html_components/summary_plots "$DIRECTORY_NAME"/failed_login_summary.html 


rm "$DIRECTORY_NAME"/temp_dist.html


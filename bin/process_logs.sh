#!/usr/bin/env bash
###### CONSTANTS ########
HERE=$(pwd)
# Target directories for decompressing
DIR_1="$1"
DIR_2="$2"
DIR_3="$3"

######## MAIN ########

# Setting up the scratch directory to extract the file contents to
SCRATCH=$(mktemp -d)


for d in "$@" 
do
	BASENAME=$(basename -s .tgz "$d")
	mkdir "$SCRATCH"/"$BASENAME"
	tar -xzf "$d" -C  "$SCRATCH"/"$BASENAME"
        ./bin/process_client_logs.sh "$SCRATCH"/"$BASENAME"
		
done	  
	
./bin/create_username_dist.sh "$SCRATCH"
./bin/create_hours_dist.sh "$SCRATCH"
./bin/create_country_dist.sh "$SCRATCH"
./bin/assemble_reports.sh "$SCRATCH"

mv "$SCRATCH"/failed_login_summary.html "$HERE"



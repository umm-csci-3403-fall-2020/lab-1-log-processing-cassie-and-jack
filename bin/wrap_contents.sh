#!/bin/bash
FILE_NAME=$1
SPECIFIER=$2
RESULTING_FILE_NAME=$3
##### MAIN #####

cat "$SPECIFIER"_header.html  "$FILE_NAME" "$SPECIFIER"_footer.html >> "$RESULTING_FILE_NAME"




~             

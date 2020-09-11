#!/bin/bash
# This script takes in a header, footer, and main text and wraps them

HEAD="$2"_header.html
FOOT="$2"_footer.html
# making a file out of the resulting file name input
touch "$3"

cat "$HEAD" "$1" "$FOOT" > "$3"

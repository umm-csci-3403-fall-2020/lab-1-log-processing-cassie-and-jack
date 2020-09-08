#!/usr/bin/env bash
###### CONSTANTS ########

# Target directories for decompressing
DIR_1="$1"
DIR_2="$2"
DIR_3="$3"
DIR_4="$4"

######## MAIN ########

# Setting up the scratch directory to extract the file contents to
SCRATCH=$(mktemp -d)

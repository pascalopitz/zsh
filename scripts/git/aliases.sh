#!/bin/bash

# Description  :
# Usage        :
# Dependencies :
# Example      :
# Notes        :

git config --get-regexp 'alias.*' | awk '{printf "\033[1;31m%s\033[0m = ", substr($1,7); $1=""; print $0}'
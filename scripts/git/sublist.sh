#!/bin/sh

# Description  :
# Usage        :
# Dependencies :
# Example      :
# Notes        :

git config -f .git/config -l | cut -d'=' -f1 | grep "submodule.$MODPATH" | sed 's/^submodule\.//' | sed 's/\.url$//'
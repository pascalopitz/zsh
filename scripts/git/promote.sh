#!/bin/sh

# Promotes a local topic branch to a remote tracking branch of the same name,
# by pushing and then setting up the git config
#
# Thanks to ENTP:
# http://hoth.entp.com/2008/11/10/improving-my-git-workflow

curr_branch=$(git symbolic-ref -q HEAD | sed -e 's|^refs/heads/||')

remote_branch=$(git branch -r | grep "origin/${curr_branch}")
[ -z "${remote_branch}" ] && ( git push origin "${curr_branch}" )

origin=$(git config --get "branch.${curr_branch}.remote")
[ -z "${origin}" ] && ( git config --add "branch.${curr_branch}.remote" origin )

merge=$(git config --get "branch.${curr_branch}.merge")
[ -z "${merge}" ] && ( git config --add "branch.${curr_branch}.merge" "refs/heads/${curr_branch}" )
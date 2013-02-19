#!/bin/bash

#simple, but super helpfull recursive grep
rgrep(){
    if [ $# = 0 ] ; then
            echo "usage: $0 grep-options PATTERN"
            echo ""
            echo "       where PATTERN is a grep-style regexp"
            echo ""
            else
        filelist=`find . -name '*.php*' -o -name '*.js' -o -name 'makefile' -o -name '*.htc' | sed -e '/ /d'`
        echo $filelist | xargs grep "$@"
        unset filelist
    fi
}

#find file (recursively)
#if wildcard, I think the command line needs quotes
ff(){
   find . -name "$1" -print
}

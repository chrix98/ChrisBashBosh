#!/bin/bash


function git-check-reset()
{
  CUR_DIR=`pwd`;
	bulk=0;

  ## the file to check
	if [ -z $1 ]; then
		echo -n "File to check (enter . to get status): "
		bulk=1
		read SRC_FILE
	else
  		SRC_FILE=$1
	fi


  if [ -z $SRC_FILE ]; then
    echo ""
    echo "  You must specify a search string or pattern to identify files to rename"
    echo ""
    echo "  Usage: $0 SEARCHPATTERN REPLACEPATTERN"
    echo "  Example: $0 \"CHIP_N_DALE.EN.Title\" \"EN.RESCUE_RANGERS_VOL01E0\""
    echo "  Result: mv CHIP_N_DALE.EN.Title1 EN.RESCUE_RANGERS_VOL01E01"
    #exit;
    return;
	elif [ "$SRC_FILE" == "." ]; then
		bulk=1;	##	causing a rerun for bulk operations
	else
		git diff $SRC_FILE;

		keep_change="";

		while [ "$keep_change" == "" ]; do
			echo -n "Do you want to keep this change or reset the file ? [y/n]:";
			read keep_change;
			if [ "$keep_change" == "n" ];then
				git checkout -- "$SRC_FILE";
			elif [ "$keep_change" == "y" ];then
				echo "keep the change!"
			else
				keep_change=""
			fi
		done
	fi

	if [ $bulk -eq 1 ]; then
		git status -s .
		git-check-reset
	fi
}




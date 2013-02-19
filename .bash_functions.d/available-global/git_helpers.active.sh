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



function garchive()
{
	if [ -d ".git" ]; then
	  # ok;
	  echo "ok";
	else
	  echo "are we in a valid repository root directory?"
	  exit 0;
	fi

	if [ -z $1 ]; then
	  echo "$0 requires 1st parameter to be revision hash for start line commit";
	  exit 0;
	fi

	if [ -z $2 ]; then
	  echo "$0 requires 2nd parameter to be revision hash for end line commit";
	  exit 0;
	fi

	if [ -z $3 ]; then
	  echo "3rd parameter for 'branch' ommitted, assuming 'develop'...";
	  branch=develop
	fi


	archive=$(basename `pwd`)
	timestamp=`date +%Y%m%d_%H%M%S`

	git archive --format=zip $branch `git diff ${1}..${2} --name-only` > ${branch}.${archive}.${1:0:7}.${2:0:7}.${timestamp}.zip

}

function githook_add
{

	if [ -d ".git" ]; then

	  #ln -s ~/githoooks/pre-commit .git/hooks/
	  cp ~/githooks/pre-commit .git/hooks

	else
	  echo "It doesn't look like you're in a git repository directory"
	fi

}
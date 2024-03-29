#!/bin/bash

zipFile=/tmp/shared_bash.zip
##defaultRemoteUser=administrator

file_list=".bash_aliases .bash_functions .bash_variables .bashrc .screenrc .nanorc .nano"

function share_bash()
{

	cur_dir=`pwd`;
	host=$1
	user=$2

	echo "attempting to copy bash utils to host: $1";

	copyBashFiles

	if [ -z "$host" ]; then
		echo "no host specified?"
		#exit 1;
	else
		if [ -z "${2}" ]; then
			echo "user not specified: ${2} - using `whoami`";
			if [ `whoami` == "chris" ]; then
				user='administrator';
			else
				user=`whoami`;
			fi
		else
			echo "user specified as ${2}"
		fi
	
		if [ -f ${zipFile} ]; then
			echo "uploading $zipFile"
			echo "${zipFile} ${user}@${host}:~/"
			scp ${zipFile} ${user}@${host}:~/
		else
			echo "no zip file found to upload..."
		fi
	fi
}

function copyBashFiles()
{
    cd ~;
    for file in $file_list;
    do
	if [ -f $file ];then
		#echo "copying file :$file";
		zip $zipFile "${file}"
	elif [ -d $file ];then
		#echo "copying directory :$file";
		zip -r $zipFile "${file}"
	else
		echo "	skipping missing file : $file"
	fi
    done;

    cd $cur_dir

}
#!/bin/bash


function multi_file_rename()
{
  CUR_DIR=`pwd`;

  ## the file name pattern to look for and replace
  SRC_PTN=$1

  ##  the value to replace SRC_PTN with
  TGT_PTN=$2


  if [ -z $SRC_PTN ]; then
    echo ""
    echo "  You must specify a search string or pattern to identify files to rename"
    echo ""
    echo "  Usage: $0 SEARCHPATTERN REPLACEPATTERN"
    echo "  Example: $0 \"CHIP_N_DALE.EN.Title\" \"EN.RESCUE_RANGERS_VOL01E0\""
    echo "  Result: mv CHIP_N_DALE.EN.Title1 EN.RESCUE_RANGERS_VOL01E01"
    #exit;
    return;
  fi

  if [ -z $TGT_PTN ]; then
    echo ""
    echo "  You must specify a replacement string or pattern to rename the files to"
    echo ""
    echo "  Usage: $0 SEARCHPATTERN REPLACEPATTERN"
    echo "  Example: $0 \"CHIP_N_DALE.EN.Title\" \"EN.RESCUE_RANGERS_VOL01E0\""
    echo "  Result: mv CHIP_N_DALE.EN.Title1 EN.RESCUE_RANGERS_VOL01E01"
    echo ""
    ##exit;
    return;
  fi

  for i in ${SRC_PTN}*; do
    #echo "$i" "${i/$SRC_PTN/$TGT_PTN}";
    mv -v "$i" "${i/$SRC_PTN/$TGT_PTN}";
  done;

}


truncfile(){
  if [ $# = 0 ]; then
    echo "usage: $0 <file name>"
    echo ""
    echo "truncates the content of the file, filesize will be 0"
    echo ""
    echo " Donations in form of cheques, booze or cash can be dropped at Chris Petermann's Desk ;-)"
  else
    if [ -a $1 ]; then
      echo "truncating file ${1}..."

      tail ${1} > ${1};

      echo "  Done.";
    else
      echo ""
      echo "${1} does not exist, do you know what you're doing?"
    fi
  fi
}


function multi_dos2unix()
{
	if [ -z $1 ];then
		echo "checking current dir: $(pwd)";
		TDIR=".";
	else
		TDIR="$1";
	fi

	for i in `find $TDIR -type f`; do
		test2=`file "$i"`;
		test3=`echo $test2 |grep -o "with CRLF line terminators"`
		#echo "test3: $test3";

		if [ ${#test3} -gt 0 ];then
			#echo "found file: $i";
			#echo "todo: dos2unix $i"
			dos2unix $i;
		fi
	done;
}
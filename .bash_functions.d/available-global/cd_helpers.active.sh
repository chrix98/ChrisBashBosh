



function changedir2workingdir()
{
  ##### Dir changing aliases
  if [ -d "$1/$2" ]; then
    cd $1/$2
  else
    curdir=`pwd`;
    cd $1;

    echo ""
    declare -a DIRCHOICES
    CHOICECOUNT=0
    for optiondir in ${2}*; do
      #echo "checking optiondir: $optiondir"
      if [ -d "$optiondir" ]; then
        let CHOICECOUNT++;

        DIRCHOICES[$CHOICECOUNT]=$optiondir
        #echo " $CHOICECOUNT : $optiondir "
      else
        echo "$optiondir is not a directory?";
      fi
    done

    if [ $CHOICECOUNT == 1 ]; then
      cd ${DIRCHOICES[1]};
      #exit
    elif [ $CHOICECOUNT > 0 ]; then
      echo " Your search term $2 matches more than one repository, please choose from the
      following: ";
      OPTIONCOUNT=1

      for options in ${DIRCHOICES[@]}; do
        echo " $OPTIONCOUNT : ${DIRCHOICES[$OPTIONCOUNT]}"
        let OPTIONCOUNT++;
      done

#     while [[ -z $choice ] || [ !-d "${DIRCHOICES[$choice]}" ]]; do
        echo ""
        echo -n "Enter number to select from above choice: "; read choice;
        echo ""
#     done;
      cd "${DIRCHOICES[$choice]}";
    else
      echo ""
      echo " Your search term [$2] didn't match any repositories... Sorry."
    fi

  fi
}

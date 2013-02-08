#!/bin/bash


function find_empty_dirs()
{
  CUR_DIR='.';
  TGT_DIR=$1


  if [ -z "$TGT_DIR" ]; then
    echo -n "confirm using current dir ("
    echo -n `pwd`;
    echo -n ") : [y/N]";

    read confirm;
    if [ "$confirm" != "y" ]; then
      echo "quitter :)"; return;
    else
      TGT_DIR=$CUR_DIR;
    fi
  fi

  ##   have to put something in here to find empty dirs automagically instead of reading text file
  # for i in `find . -type d -empty`; do ...
  #find . -type d -empty

  echo -n "Searching for empty dirs in : "
  if [ $TGT_DIR == $CUR_DIR ]; then
    pwd;
  else
    echo $TGT_DIR;
  fi

  oldIFS=$IFS;
  IFS=$'\n';
  #lines=($(cat empty_dirs.txt));
  lines=($(find $TGT_DIR -type d -empty));
  IFS=$oldIFS;
  x=0;
  for l in "${lines[@]}";
  do
    #rm -rfv "$l";
    echo "DIR: $l";
    let x++;
  done;
  echo "There are $x empty directories within the \"$TGT_DIR\" tree ";

}

function remove_empty_dirs()
{
  CUR_DIR='.';
  TGT_DIR=$1

  if [ -z "$TGT_DIR" ]; then
    echo -n "confirm using current dir ("
    echo -n `pwd`;
    echo -n ") : [y/N]";

    read confirm;
    if [ "$confirm" != "y" ]; then
      echo "quitter :)"; return;
    else
      TGT_DIR=$CUR_DIR;
    fi
  fi

  ##   have to put something in here to find empty dirs automagically instead of reading text file
  # for i in `find . -type d -empty`; do ...
  #find . -type d -empty

  echo -n "Searching for empty dirs in : "
  if [ $TGT_DIR == $CUR_DIR ]; then
    pwd;
  else
    echo $TGT_DIR;
  fi

  oldIFS=$IFS;
  IFS=$'\n';
  #lines=($(cat empty_dirs.txt));
  lines=($(find $TGT_DIR -type d -empty));
  IFS=$oldIFS;
  x=0;
  for l in "${lines[@]}";
  do
    rm -rfv "$l";
    #echo "DIR: $l";
    let x++;
  done;
  echo "Removed $x empty directories from the \"$TGT_DIR\" tree";

}


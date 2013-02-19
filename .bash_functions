#!/bin/bash

if [ -d "${HOME}/.bash_functions.d" ]; then
	echo " ... ${HOME}/.bash_functions.d"
  if [ -d "${HOME}/.bash_variables.d/enabled-$(hostname)" ]; then
    BASHDIR_FUNCS="${HOME}/.bash_functions.d/enabled-$(hostname)"
  else
    BASHDIR_FUNCS="${HOME}/.bash_functions.d/available-global"
  fi

	for helper in ${BASHDIR_FUNCS}/*.active.sh; do
		echo "Sourcing Helper: $helper"
		source "$helper"
	done
fi

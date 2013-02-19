#!/bin/bash

if [ -d "${CBBINSTALLDIR}/.bash_functions.d" ]; then
	echo " ... ${CBBINSTALLDIR}/.bash_functions.d"
  if [ -d "${CBBINSTALLDIR}/.bash_variables.d/enabled-$(hostname)" ]; then
    BASHDIR_FUNCS="${CBBINSTALLDIR}/.bash_functions.d/enabled-$(hostname)"
  else
    BASHDIR_FUNCS="${CBBINSTALLDIR}/.bash_functions.d/available-global"

  fi

	for helper in ${BASHDIR_FUNCS}/*.active.sh; do
		echo "Sourcing Helper: $helper"
		source "$helper"
	done
fi

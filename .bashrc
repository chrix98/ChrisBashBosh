
####	ChrisBashBosh' stuff
export CBBINSTALLDIR="${HOME}/${ChrisBashBoshPath}/"

# source the users aliases if they exist
if [ -f "${CBBINSTALLDIR}/.bash_variables" ]; then
	#  echo "  ... ${CBBINSTALLDIR}/.bash_variables"
	source "${CBBINSTALLDIR}/.bash_variables"
fi


# source the users aliases if they exist
if [ -f "${CBBINSTALLDIR}/.bash_aliases" ]; then
	#  echo "  ... ${CBBINSTALLDIR}/.bash_aliases"
  source "${CBBINSTALLDIR}/.bash_aliases"
fi

# source the users funcs if they exist
if [ -f "${CBBINSTALLDIR}/.bash_functions" ];then
	source ${CBBINSTALLDIR}/.bash_functions;	
fi



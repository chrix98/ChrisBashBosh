

if [ -d "${HOME}/.bash_aliases.d" ]; then
	echo " ... ${HOME}/.bash_aliases.d"
  if [ -d "${HOME}/.bash_variables.d/enabled-$(hostname)" ]; then
    BASHDIR_ALIASES="${HOME}/.bash_aliases.d/enabled-$(hostname)"
  else
    BASHDIR_ALIASES="${HOME}/.bash_aliases.d/available-global"
  fi

	for aliasfile in ${BASHDIR_ALIASES}/*.active ; do
		echo "sourcing Alias: $aliasfile"
		source "$aliasfile";
	done
fi

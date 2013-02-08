# To the extent possible under law, the author(s) have dedicated all 
# copyright and related and neighboring rights to this software to the 
# public domain worldwide. This software is distributed without any warranty. 
# You should have received a copy of the CC0 Public Domain Dedication along 
# with this software. 
# If not, see <http://creativecommons.org/publicdomain/zero/1.0/>. 

# base-files version 4.0-9

# ~/.bashrc: executed by bash(1) for interactive shells.

# The latest version as installed by the Cygwin Setup program can
# always be found at /etc/defaults/etc/skel/.bashrc

# Modifying /etc/skel/.bashrc directly will prevent
# setup from updating it.

# The copy in your home directory (~/.bashrc) is yours, please
# feel free to customise it to create a shell
# environment to your liking.  If you feel a change
# would be benifitial to all, please feel free to send
# a patch to the cygwin mailing list.

# User dependent .bashrc file

# If not running interactively, don't do anything
[[ "$-" != *i* ]] && return

# Shell Options
#
# See man bash for more options...
#
# Don't wait for job termination notification
# set -o notify
#
# Don't use ^D to exit
# set -o ignoreeof
#
# Use case-insensitive filename globbing
# shopt -s nocaseglob
#
# Make bash append rather than overwrite the history on disk
# shopt -s histappend
#
# When changing directory small typos can be ignored by bash
# for example, cd /vr/lgo/apaache would find /var/log/apache
shopt -s cdspell

# Completion options
#
# These completion tuning parameters change the default behavior of bash_completion:
#
# Define to access remotely checked-out files over passwordless ssh for CVS
# COMP_CVS_REMOTE=1
#
# Define to avoid stripping description in --option=description of './configure --help'
# COMP_CONFIGURE_HINTS=1
#
# Define to avoid flattening internal contents of tar files
# COMP_TAR_INTERNAL_PATHS=1
#
# Uncomment to turn on programmable completion enhancements.
# Any completions you add in ~/.bash_completion are sourced last.
# [[ -f /etc/bash_completion ]] && . /etc/bash_completion

# History Options
#
# Don't put duplicate lines in the history.
# export HISTCONTROL=$HISTCONTROL${HISTCONTROL+,}ignoredups
#
# Ignore some controlling instructions
# HISTIGNORE is a colon-delimited list of patterns which should be excluded.
# The '&' is a special pattern which suppresses duplicate entries.
# export HISTIGNORE=$'[ \t]*:&:[fb]g:exit'
# export HISTIGNORE=$'[ \t]*:&:[fb]g:exit:ls' # Ignore the ls command as well
#
# Whenever displaying the prompt, write the previous line to disk
# export PROMPT_COMMAND="history -a"

####	Chris' stuff

# source the users aliases if they exist
if [ -d "${HOME}/.bash_variables" ]; then
	echo " ... ${HOME}/.bash_variables"
	for varfile in ${HOME}/.bash_variables/variables.*; do
		echo "Varfile: $varfile"
		source "$varfile"
	done
else
	if [ -f "${HOME}/.bash_variables" ]; then
	#  echo "  ... ${HOME}/.bash_variables"
	  source "${HOME}/.bash_variables"
	fi
fi


# source the users aliases if they exist
if [ -f "${HOME}/.bash_aliases" ]; then
#  echo "  ... ${HOME}/.bash_aliases"
  source "${HOME}/.bash_aliases"
fi

# source the users funcs if they exist
if [ -d "${HOME}/.bash_functions" ]; then
  echo "  ... ${HOME}/.bash_functions"
	for helper in ${HOME}/.bash_functions/*.sh; do
		#echo "Helper: $helper"
  	source $helper
	done
else
	if [ -f "${HOME}/.bash_functions" ];then
		source ${HOME}/.bash_functions;	
	fi
fi

# source the user remote login aliases
if [ -f "${HOME}/.bash_remote_logins" ]; then
#	echo " ... ${HOME}/.bash_remote_logins"
	source "${HOME}/.bash_remote_logins"
fi


#####	Adding various bins to path

PATHLIST=(\
	"/usr/local/bin" \
	"$HOME/bin" \
	"/cygdrive/c/Users/chris.petermann/bin" \
	"/usr/local/rnt/bin" \
	"${HOME}/pubbin" \
	"/cygdrive/c/Program Files (x86)/EditPlus 3" \
	"/cygdrive/c/Program Files (x86)/WinMerge" \
	"/cygdrive/c/Program Files (x86)/WinSCP" \
	"/cygdrive/c/Program Files (x86)/NuSphere/PhpED/" \
	"/cygdrive/c/Program Files (x86)/ActiveState Komodo IDE 6/" \
	)
len=${#PATHLIST[*]}
pathnum=0
NEWPATH=

#echo "Pathlist has $len items"

while [ $pathnum -lt $len ]; do
	epath="${PATHLIST[$pathnum]}"
	#echo "$pathnum : $epath"
	let pathnum++
	if [ -d "$epath" ]; then
		NEWPATH="${NEWPATH}:${epath}"
	#else
		#echo "$epath does not exist";
	fi
done

if [ -n "$NEWPATH" ]; then
	#echo "new path: $NEWPATH"
	PATH="${PATH}:${NEWPATH}"
	export PATH
#else
	#echo "no path changes"
fi


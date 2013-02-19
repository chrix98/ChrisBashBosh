# To the extent possible under law, the author(s) have dedicated all 
# copyright and related and neighboring rights to this software to the 
# public domain worldwide. This software is distributed without any warranty. 
# You should have received a copy of the CC0 Public Domain Dedication along 
# with this software. 
# If not, see <http://creativecommons.org/publicdomain/zero/1.0/>. 

# base-files version 4.0-9

# ~/.bash_profile: executed by bash(1) for login shells.

# The latest version as installed by the Cygwin Setup program can
# always be found at /etc/defaults/etc/skel/.bash_profile

# Modifying /etc/skel/.bash_profile directly will prevent
# setup from updating it.

# The copy in your home directory (~/.bash_profile) is yours, please
# feel free to customise it to create a shell
# environment to your liking.  If you feel a change
# would be benifitial to all, please feel free to send
# a patch to the cygwin mailing list.

# User dependent .bash_profile file
########################################################################

umask 002


# Set user-defined locale
#export LANG=$(locale -uU)

#echo "sourcing ..."
# source the users bashrc if it exists
if [ -f "${CBBINSTALLDIR}/.bashrc" ] ; then
#	echo "	... ${CBBINSTALLDIR}/.bashrc"
  source "${CBBINSTALLDIR}/.bashrc"
fi


# Set MANPATH so it includes users' private man if it exists
# if [ -d "${CBBINSTALLDIR}/man" ]; then
#   MANPATH="${CBBINSTALLDIR}/man:${MANPATH}"
# fi

# Set INFOPATH so it includes users' private info if it exists
# if [ -d "${CBBINSTALLDIR}/info" ]; then
#   INFOPATH="${CBBINSTALLDIR}/info:${INFOPATH}"



#####	Custom startup stuff 


if [ -z $BASHHERE ]; then
	BASHHERE=${HOME}
else
	BASHHERE="$(cygpath -u -a ${BASHHERE//\"})"
fi

if [ "${BASHHERE}" != "/rxvt" ]; then
	echo "Changing into Directory:" ${BASHHERE}
	if [ -d "${BASHHERE}" ]; then
		cd "${BASHHERE}";
	else
		echo "$BASHHERE is not a directory"
		cd "$HOME"
	fi
fi

###################################	old stuff



if [ -z $BASHERRORS ]; then
	clear
fi


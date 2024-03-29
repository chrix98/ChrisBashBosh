#!/bin/bash
unset remote_host;unset remote_group; unset remote_user; unset remote_port; unset remote_name; unset remote_farm

declare -a remote_host
declare -a remote_user
declare -a remote_port
declare -a remote_name
declare -a remote_farm

for srcfile in `find ${BASHDIR_VARS} -name remote_login.*.active`; do
	#echo $srcfile
	source $srcfile
done;

function pod() {
	unset choice;
	choice=100;

	if [ -z $1 ]; then
		echo ""
		echo "	*****************************************************************"
		echo "	*								*"
		echo "	*		choose your pod ... wisely!			*"

		i=0;
		prevFarm="";

		while [ $i -lt ${#remote_host[*]} ]; do
			#echo "${remote_farm[i]} => ${prevFarm}"
			if [ "${remote_farm[i]}" != "${prevFarm}" ]; then
				echo "	*								*"
				echo "	*****************************************************************"
				echo "	*	${remote_farm[i]}						*"
				echo "	*****************************************************************"
				prevFarm=${remote_farm[i]}
			fi

			echo "	*  ${i} - ${remote_name[i]}	[ ${remote_host[i]}:${remote_port[i]} ]		*";
			let i++;
		done;

				echo "	*								*"
				echo "	*****************************************************************"

		while [[ $choice != [0-9qQ]* ]]  || [ -z ${remote_host[$choice]} ]; do
				prompt "Whats it gonna be, punk? [enter number or q to quit]:"
		done;

	else
		if [[ $1 != [0-9]* ]] || [ -z ${remote_host[$1]} ]; then
			echo "could not find a host for that number";
			choice="x";
		else
			choice=$1;
		fi
	fi

	if [[ $choice != [qQx] ]]; then

		banner "[${remote_host[$choice]//\.cloud/}]"
		echo ""
		#echo "${remote_host[$choice]} is a good choice ... connecting..."
		echo ""
		ssh -p ${remote_port[$choice]} ${remote_user[$choice]}@${remote_host[$choice]}
		echo ""
		echo "	thank you for using POD :) Have a nice day!"
	elif [ $choice == "x" ];then
		echo ""
		echo "	invalid input... try again.";
	else
		echo ""
		echo "	... quitter!"
	fi

}

function prompt() {
	echo ""
	echo -n "	${1}";
	read choice
	#return "$choice"
}
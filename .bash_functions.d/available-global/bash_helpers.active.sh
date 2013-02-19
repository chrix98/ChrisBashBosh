
function create_dir_hostd()
{

	for i in ~/.bash_*.d; do
		#echo $i;
		tgt=${i}/enabled-$(hostname)

		if [ -d $tgt ]; then
			echo " host.d directory exists already: $tgt"
		else
			echo "making dir: $tgt"
			mkdir -p ${tgt}
		fi
	done;

}

function in_array()
{

	##	$1 = needle
	##	$2 = haystack

	if [ ${#2[@]} -eq 0 ];then
		return
	fi

	for i in ${2[@]}; do
		if [ $1 == $i ];then
			return true;
		fi
	done
}
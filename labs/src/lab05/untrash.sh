#!/usr/bin/env bash

trash_dir=$HOME/trash
trash_log_file=$HOME/trash.log

if [[ $# -ne 1 ]]
then
	echo "Error: expected one parameter."
	exit 1
fi
file="$1"

if [[ ! -d ${trash_dir} || ! -e ${trash_log_file} ]]
then
	echo "Error: unsupported operation."
	exit 1
fi

number=$(grep -c -s $1 ${trash_log_file})
for i in $(grep -s $1 ${trash_log_file})
do
	count=$(echo ${i} | awk -F ':' '{print $1}')
	path=$(echo ${i} | awk -F ':' '{print $2}')
	name=$(echo ${i} | awk -F ':' '{print $3}')

	content_file=${trash_dir}/${count}
	restoring_file=${path}/${name}

	if [[ -e ${content_file} ]]
	then
		echo "Do you want to restore file $restoring_file ? [Y/n]"
		read answer
		if [[ ${answer} == "y" || ${answer} == "Y" ]]
		then
			if [[ -d $(dirname ${restoring_file}) ]]
			then
				if [[ -e ${restoring_file} ]]
				then
					echo "Error: file already exists."
					exit 1
				fi
				ln ${content_file} ${restoring_file}
			else
				echo "Directory $(dirname ${restoring_file}) was removed so file will be created in home directory."
				ln ${content_file} $HOME/${file}
			fi
			echo "File was restored."

			rm ${content_file}
			sed -i "${count}s/.*/${count}:$:$/" ${trash_log_file}
		fi
	else
	    number=$((number - 1))
    fi
done

if [[ ${number} -eq 0 ]]
then
    echo "No files with name ${file}"
    exit 0
fi
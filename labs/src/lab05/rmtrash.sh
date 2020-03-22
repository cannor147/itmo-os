#!/usr/bin/env bash

trash_dir=$HOME/trash
trash_log_file=$HOME/trash.log

if [[ $# -ne 1 ]]
then
	echo "Error: expected one parameter."
	exit 1
fi

if [[ ! -f $1 ]]
then
	echo "Error: first parameter should be an existing file."
	exit 1
fi

file=$1

if [[ ! -d ${trash_dir} ]]
then
	mkdir ${trash_dir}
	touch ${trash_log_file}
fi

count=($(wc -l "${trash_log_file}"))
count=$((${count} + 1))

ln ${file} ${trash_dir}/${count}
rm ${file}

echo "File was removed."

echo "${count}:$(pwd):${file}" >> ${trash_log_file}
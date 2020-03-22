#!/usr/bin/env bash

restore_folder="$HOME/restore/"

if [[ ! -d "${restore_folder}" ]]
then
  	mkdir "${restore_folder}"
fi

backup_folders=$(ls $HOME/*/ | grep -o -E "Backup-[0-9]{4}-[0-9]{2}-[0-9]{2}")
last_backup_folder="$HOME/$(echo "${backup_folders}" | tail -1)"
if [[ ! -d "${last_backup_folder}" ]]
then
	echo "Error: no backup folder."
  	exit 1
fi
cd "$last_backup_folder"

files=$(find . -type f | grep -E -v ".[0-9]{4}-[0-9]{2}-[0-9]{2}")
echo "${files}" | while read file
do
  	if [[ -d "${restore_folder}/${file}" ]]
	then
        echo "Overwriting directory ${restore_folder}${file} with file ${file}"
        rm -rf "${restore_folder}/${file}"
  	fi
  	cp --parents "${file}" "${restore_folder}/"
done
#!/usr/bin/env bash

source_folder="$HOME/source"
report_filename="$HOME/backup-report"

if [[ ! -d "${source_folder}" ]]
then
	echo "Error: no source folder."
	exit 1
fi
cd "$source_folder"

last_backup_date=0
last_backup_folder=""
backup_folders=$(ls $HOME/*/ | grep -o -E "Backup-[0-9]{4}-[0-9]{2}-[0-9]{2}")
if [[ ${backup_folders} ]]
then
  	last_backup_folder=$(echo "${backup_folders}" | tail -1)
  	last_backup_date=$(echo "${last_backup_folder}" | grep -o -E "[0-9]{4}-[0-9]{2}-[0-9]{2}")
  	last_backup_date_number=$(date -d ${last_backup_date} +%s)
fi

current_date=`date +%Y-%m-%d`
current_date_number=$(date -d ${current_date} +%s)

backup_folder=""
new_folder_was_created=false

if [[ ${current_date_number} -gt ${last_backup_date_number}+7*24*60*60 ]]
then
  	backup_folder="$HOME/Backup-${current_date}"
  	mkdir ${backup_folder}
  	new_folder_was_created=true
else
  	backup_folder="$HOME/${last_backup_folder}"
fi

files=$(find . -type f)
if [[ ${new_folder_was_created} == true ]]
then
	echo "${backup_folder} created at ${current_date}" >> ${report_filename}
	echo "$files" | while read filename
    do
        cp --parents "$filename" "${backup_folder}/"
        echo "$filename copied to ${backup_folder} at ${current_date}" >> ${report_filename}
    done
else
	echo "$files" | while read filename
    do
        if [[ -e "${backup_folder}/$filename" ]]
        then
            old_file_size=$(stat -c%s "${backup_folder}/$filename")
            new_file_size=$(stat -c%s "$source_folder/$filename")

            if [[ ${old_file_size} -ne ${new_file_size} ]]
            then
                mv "${backup_folder}/$filename" "${backup_folder}/$filename.${current_date}"
                cp "$source_folder/$filename" "${backup_folder}/$filename"

                echo "$filename was renamed to $filename.${current_date} ${current_date}" >> ${report_filename}
                echo "$filename copied to ${backup_folder} at ${current_date}" >> ${report_filename}
            fi
        else
            cp --parents "$filename" "${backup_folder}/"
            echo "$filename copied to ${backup_folder} at ${current_date}" >> ${report_filename}
        fi
    done
fi

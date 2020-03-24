#!/usr/bin/env bash

out='./out/production/lab04'

> $out/task5_connection

while true
do
	read line
	echo "$line" >> $out/task5_connection

	if [[ "$line" == "QUIT" ]]
	then
		exit 0
	fi

	if [[ ! "$line" =~ [0-9]+ && "$line" != "+" && "$line" != "*" ]]
	then
		echo "Incorrect message"
		exit 1
	fi
done
#!/usr/bin/env bash

out='./out/production/lab04'

while true
do
	read line
	case $line in
		"TERM")
			kill -SIGTERM $(cat $out/task6_connection)
			exit 0
			;;
		*)
			continue
			;;
	esac
done

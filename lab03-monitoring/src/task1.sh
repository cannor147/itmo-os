#!/usr/bin/env bash

out='./out/production/lab03'
user='cannor147'

ps -u ${user} -o pid,command | awk '{ printf $1; $1=""; printf ":"; print $0; }' > ${out}/user-processes.txt
wc -l ${out}/user-processes.txt | awk '{ print $1 - 1}'
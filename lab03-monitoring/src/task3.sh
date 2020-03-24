#!/usr/bin/env bash

out='./out/production/lab03'
folder="/sbin"

ps ax -o pid,command | grep $folder/ | awk '{ print $1 }' > $out$folder-processes.txt
#!/usr/bin/env bash

folder='/etc/passwd'

awk -F "&" '{print $3 " " $1}' $folder | sort -n

exit 0
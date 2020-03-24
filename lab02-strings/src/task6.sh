#!/usr/bin/env bash

folder='/var/log'

find $folder -readable -name '*.log' 2>&1 | grep -v "Permission denied" | xargs wc -l

exit 0
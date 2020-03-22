#!/usr/bin/env bash

folder='/bin'

grep -r -s -o -E "^#![[:alnum:]/]+" $folder/* | awk -F "#!" '{print $2}' | sort | uniq -i -c | sort -n -r | head -1

exit 0
#!/usr/bin/env bash

out='./out/production/lab02'
folder='/etc'

email_regex="[a-zA-Z0-9_.]+@[a-zA-Z0-9_]+(\\.[a-zA-Z]+)+"
grep -E -r -h -s -o -w $email_regex $folder | sort | uniq -u | awk '{printf("%s, ", $1)}' > $out/emails.lst

exit 0
#!/usr/bin/env bash

out='./out/production/lab02'
folder='/var/log'

grep -r -h -s "ACPI" $folder > $out/errors.log
grep  -E "/[A-Za-z0-9_-@]+\.[A-Za-z][A-Za-z0-9_\]+" $out/errors.log

exit 0
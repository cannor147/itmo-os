#!/usr/bin/env bash

out='./out/production/lab02'
file='/var/log/Xorg.0.log'

info='(II)'
warning='(WW)'

grep -h -s $warning $file | sed "s/$warning/Warning:/" > $out/full.log
grep -h -s $info $file | sed "s/$info/Information:/" >> $out/full.log

exit 0
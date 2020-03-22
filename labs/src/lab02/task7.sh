#!/usr/bin/env bash

man bash | tr -c "[:alnum:]" "\n" | grep -E ".{4}" | sort | uniq -i -c | sort -n -r | head -3

# just stupid comment
# wow #!cool ####test####

exit 0
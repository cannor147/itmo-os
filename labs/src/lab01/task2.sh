#!/usr/bin/env bash

if (( $1 > $2 )) && (( $1 > $3 ))
    then echo $1
    else if (( $2 > $3 ))
        then echo $2
        else echo $3
    fi
fi
#kek

exit 0
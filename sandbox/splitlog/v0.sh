#!/bin/bash
# http://stackoverflow.com/questions/11687054/split-access-log-file-by-dates-using-command-line-tools

while read; do
    [[ $REPLY =~ \[(..)/(...)/(....): ]]

    d=${BASH_REMATCH[1]}
    m=${BASH_REMATCH[2]}
    y=${BASH_REMATCH[3]}

    if [ $1 = $y/$m ] ; then
       printf -v fname "access.apache.%s_%s_%s.log" $y $m $d
       echo "$REPLY" >> $fname
    fi

    if [ $1 = $y/$m/$d ] ; then
       printf -v fname "access.apache.%s_%s_%s.log" $y $m $d
       echo "$REPLY" >> $fname
    fi 

done < access.log

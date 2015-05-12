#!/bin/bash

year="2014"

for month in $1; do
   for day in 1 2 3 4 5 6 7 8 9 10 ... 31 ; do
      cat access.log | grep -i $day/$month/$year > $day-$month-$year.log
   done
done

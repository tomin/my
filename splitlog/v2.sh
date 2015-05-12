#!/bin/bash

if [ $# -eq 0 ] 
then
   cat access.log | perl -n -e'm@\[(\d{1,2})/(\w{3})/(\d{4}):@; open(LOG, ">>access.$3_$2_$1.log"); print LOG $_;'
else
   cat access.log | grep -i $1 | perl -n -e'm@\[(\d{1,2})/(\w{3})/(\d{4}):@; open(LOG, ">>access.$3_$2_$1.log"); print LOG $_;'
fi

#!/bin/bash

# 0 1 2
#2017/05/25
# 3 4 5
todate=$(date -d "00:00 $1/$2/$3" +%s)
startdate=$(date -d "00:00 $4/$5/$6" +%s)
newdate=$startdate
echo $newdate
echo $todate
echo $(($todate-$newdate))
#space after [ and before ] is needed
while [ $todate -ge $newdate ]
do
    str=$(date -u -d @$newdate +'%Y%m%d_%H%M')
    source="https://[**].blob.core.windows.net/singlejrnylinks/"
    dest="https://[**].blob.core.windows.net/singlejrnylinks/"
    echo $source
    echo $dest
    echo $str
    rm ./testdata/*
    azcopy --quiet --source $source --include "file_$str" --source-key "**==" --destination ./testdata

    azcopy --quiet --source ./testdata --include "file_$str" --destination $dest --dest-key "xx=="

    newdate=$((newdate+3600))
done


#!/usr/bin/env bash
csv=$1

files=`ls -1 -I magic.sh -I $csv`

while IFS=, read -r lastName firstName gender cid
do
    echo "Making files for : $cid"

    # for file in $files
    # do
    #     cp -v $file "${cid}_${file}"
    # done

done < $csv

lastEntry=`tail -1 $csv`
colunmNum=0

for entry in ${lastEntry//,/ }
do
    if [ $colunmNum -eq 3 ]; then
        echo "Making files for : $entry"
        # for file in $files
        # do
        #     cp -v $file "${cid}_${file}"
        # done
        exit
    fi
    ((colunmNum+=1))
done
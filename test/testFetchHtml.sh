#!/bin/bash
FILE_ORIG=../docs/list.xhtml
DIR_DEST=../html/infojobs/positions
END=10

for i in $(seq 1 $END); do
    FILE=position$i.html
    echo "Generating $FILE"
    cp $FILE_ORIG $DIR_DEST/$FILE
    sleep 1
done

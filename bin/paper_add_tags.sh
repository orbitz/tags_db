#!/bin/sh

PAPER=$1
shift

[ -f "$PAPER" ] || exit 1

MD5SUM=`md5 $PAPER | awk '{ print $NF }'`

for TAG in "$@"
do
    sqlite3 papers.db "INSERT INTO tags (tag, doc_id) VALUES (\"$TAG\", \"$MD5SUM\")"
done

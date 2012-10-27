#!/bin/sh

PAPER=$1

[ -f "$PAPER" ] || exit 1

MD5SUM=`md5 $PAPER | awk '{ print $NF }'`

sqlite3 papers.db "INSERT INTO papers (doc_id, path) VALUES(\"$MD5SUM\", \"$PAPER\")"


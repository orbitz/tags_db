#!/bin/sh

sqlite3 papers.db 'CREATE TABLE papers (doc_id STRING PRIMARY KEY, path STRING)'
sqlite3 papers.db 'CREATE TABLE tags (tag STRING, doc_id STRING, PRIMARY KEY (tag, doc_id), FOREIGN KEY (doc_id) REFERENCES papers(doc_id))'

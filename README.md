tags_db is an extremely simple bash script that lets you add a value and
associate tags with it.  It is backed by sqlite3.  I am using it as my own
personal version of the delicious webapp.

There is a script to import a delcious export to tags_db.

## Operations

### init
Initialize a db

    tags_db init

### add, a
    tags_db add name [tag1 tag2 ... tagn]

### all
Print all names

    tags_db all

### tags_add, ta
    tags_db tags_add name [tag1 tag2 ... tagn]

### tags_all
Print all tags in the system

    tags_db tags_all

### tags_del
    tags_db tags_del name [tag1 tag2 ... tagn]

### tags_search, ts
Searches for the intersection of tags

    tags_db tags_search [tag1 tag2 ... tagn]

### tags_show
Shows the tags associated with a name

    tags_db tags_show name

### del
Delete a name and its associated tags

    tags_db del name

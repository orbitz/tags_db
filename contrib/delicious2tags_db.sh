#!/bin/sh

# Very ungraceful script to take delicious entries and put them in a tag
# It makes 1 special tag with the title in it
# and will alter any tags by changing a double quote to a single quote.
# Sorry, tags_db just doesn't support such insanity

while read line
do
    echo $line | grep -Eo "A HREF=\"[^\"]+\"" > /dev/null 2>&1
    if [ "$?" = "0" ]
    then
	HREF=`echo "$line" | sed 's/^.*A HREF="\([^"]*\)".*$/\1/'`
	TAGS=`echo "$line" | sed 's/^.*TAGS="\([^"]*\)".*$/\1/' | sed 's/[[:space:]]+,[[:space:]]/,/'`
	TITLE=`echo "$line" | sed 's/^.*>\([^>]*\)<.*$/\1/'`
	ALL_TAGS=$TAGS,title:$TITLE
	echo -n $ALL_TAGS | sed "s/\"/'/g" | xargs -d ',' tags_db add "$HREF"
    fi
done

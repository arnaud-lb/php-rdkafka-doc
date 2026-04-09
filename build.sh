#!/bin/bash
#copy current doc to not mess up files that have replacement mechanisms
rm -rf /php-rdkafka-doc/output
cd /php-rdkafka-doc

# Set the path to PHP from environment or use which to discover it
if [ "$PHP" == "" ];
then
	PHP=$(which php 2>/dev/null)
fi

if [ "$PHD" == "" ];
then
	PHD="$PHP /phd/render.php"
fi

# Sets the browser application from environment or falls back on open if it is found
if [ "$BROWSER" == "" ];
then
	BROWSER=$(which open 2>/dev/null)
fi

# Test for executability of PHP
if [ ! -x "$PHP" ];
then
	echo "Cannot execute PHP ($PHP) !"
	exit 1
fi

# Configure Documentation
$PHP doc-base/configure.php  --enable-xml-details --with-partial=book.rdkafka

# Generate Documentation
$PHD --docbook doc-base/.manual.book.rdkafka.xml --package PHP --format xhtml

# Opens a browser if it is appropriate to do so
if [ "$BROWSER" != "" ];
then
    if [ -f output/php-chunked-xhtml/index.html ];
    then
	    $BROWSER output/php-chunked-xhtml/index.html 2>/dev/null 1>/dev/null </dev/null &
	fi
fi

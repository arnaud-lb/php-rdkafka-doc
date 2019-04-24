#!/bin/bash

#build the doc
./build.sh

#change permissions for apache
chgrp -R www-data /doc

#symlink the generated doc
rm -rf /var/www/html
ln -s /doc/output/php-chunked-xhtml /var/www/html

apache2-foreground

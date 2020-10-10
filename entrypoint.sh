#!/bin/bash

set -e

pwd
ls -l

cd php-rdkafka-doc

#build the doc
./build.sh

exit 0

#change permissions for apache
chgrp -R www-data /php-rdkafka-doc

#symlink the generated doc
rm -rf /var/www/html
ln -s /php-rdkafka-doc/output/php-chunked-xhtml /var/www/html

apache2-foreground

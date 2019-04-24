#!/bin/bash
./build.sh
chgrp -R www-data /doc
rm -rf /var/www/html
ln -s /doc/output/php-chunked-xhtml /var/www/html
apache2-foreground

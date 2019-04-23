FROM php:7.3.4-cli-stretch

RUN apt-get install bash

RUN pear install doc.php.net/PhD && pear install doc.php.net/PhD_PHP

WORKDIR /php-rdkafka-doc

ENTRYPOINT ./build.sh

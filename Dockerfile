FROM php:7.3-apache

RUN apt-get install bash

RUN pear install doc.php.net/PhD && pear install doc.php.net/PhD_PHP

WORKDIR /php-rdkafka-doc

ENTRYPOINT ./entrypoint.sh

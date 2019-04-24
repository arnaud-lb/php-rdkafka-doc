# php-rdkafka-doc

This is the documentation repository for [php-rdkafka](https://github.com/arnaud-lb/php-rdkafka).

## Reading documentation

The documentation can be read at https://arnaud-lb.github.io/php-rdkafka/phpdoc/

## Building documentation

- Install [docker](https://docs.docker.com/install/) and [docker-compose](https://docs.docker.com/compose/install/)
- Run docker-compose up
- Visit http://localhost:8081 to see the compiled version of the documentation

Note: to rebuild the documentation and see changes you made, run:
```
docker-compose exec apache ./build.sh
```
This will be done on startup as well

This is a stripped-down version of the PHP documentation that can be found here:
https://svn.php.net/viewvc/phpdoc/. The goal would be to merge it there
once the required quality is achieved.

The documentation of the rdkafka extension itself is in [en/reference/rdkafka](https://github.com/arnaud-lb/php-rdkafka-doc/tree/master/en/reference/rdkafka).

#!/bin/sh
set -e
cd gh-pages
rsync -av --delete ../php-rdkafka-doc/output/php-chunked-xhtml/ phpdoc/
git add .
git commit -m "Update to $GITHUB_SHA"
git push origin HEAD

#!/bin/sh
set -ex

cd gh-pages

rsync -av --delete ../php-rdkafka-doc/output/php-chunked-xhtml/ phpdoc/

git config user.email "arnaud.lb+php-rdkafka-doc-bot@gmail.com"
git config user.name "Build bot"

git add .
git commit -m "Update to $GITHUB_SHA" --allow-empty
git push origin HEAD

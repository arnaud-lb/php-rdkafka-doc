#!/bin/sh
set -ex

cd gh-pages

rsync -av --delete ../php-rdkafka-doc/output/php-chunked-xhtml/ phpdoc/

git config user.email "arnaud.lb+php-rdkafka-doc-bot@gmail.com"
git config user.name "Build bot"

git remote set-url origin "$(git config --get remote.origin.url | sed 's#http.*com/#git@github.com:#g')"
eval `ssh-agent -t 60 -s`
echo "$GHA_DEPLOY_KEY" | ssh-add -
mkdir -p ~/.ssh/
ssh-keyscan github.com >> ~/.ssh/known_hosts

git add .
git commit -m "Update to $GITHUB_SHA"
git push origin HEAD

ssh-agent -k

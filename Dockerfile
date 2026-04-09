FROM php:8.5

RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get -y install bash git

RUN mkdir phd \
    && cd phd \
    && git init \
    && git remote add origin https://github.com/php/phd.git \
    && git fetch --depth 1 origin e546e7b8d8f4a93c4cdf25ac30070f5ea010b0d7 \
    && git checkout FETCH_HEAD

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]

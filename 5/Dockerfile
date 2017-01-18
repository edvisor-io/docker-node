FROM node:5-slim

RUN apt-get update \
  && apt-get install --assume-yes --no-install-recommends \
    apt-transport-https build-essential git python \
    imagemagick wkhtmltopdf \
    less unzip vim \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - \
  && echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list \
  && apt-get update \
  && apt-get install --assume-yes yarn \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

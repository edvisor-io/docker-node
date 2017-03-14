FROM node:6-slim

ENV NPM_CONFIG_LOGLEVEL warn

RUN apt-get update \
  && apt-get install --assume-yes --no-install-recommends \
    apt-transport-https build-essential git python ssh \
    imagemagick \
    less unzip vim \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - \
  && echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list \
  && apt-get update \
  && apt-get install --assume-yes yarn \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN npm install --global node-gyp

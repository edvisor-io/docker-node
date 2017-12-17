FROM node:6-slim

ENV NPM_CONFIG_LOGLEVEL error

RUN apt-get update \
  && apt-get install --assume-yes --no-install-recommends \
    build-essential git python ssh \
    less vim \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN yarn global add node-gyp node-pre-gyp npm@latest

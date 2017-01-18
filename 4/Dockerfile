FROM node:4-slim

RUN apt-get update \
  && apt-get install --assume-yes --no-install-recommends \
    build-essential git python \
    imagemagick \
    less unzip vim \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

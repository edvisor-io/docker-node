FROM node:12.21.0-slim

RUN apt-get update \
  && apt-get install --assume-yes --no-install-recommends \
    build-essential git python ssh \
    less vim \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
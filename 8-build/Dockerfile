FROM edvisor/node:8

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update \
  && apt-get install --assume-yes --no-install-recommends \
    apt-transport-https \
    libfontconfig1 \
    software-properties-common \
    unzip \
  && curl --silent --show-error --location https://download.docker.com/linux/debian/gpg | apt-key add - \
  && add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/debian jessie stable" \
  && add-apt-repository "deb http://deb.debian.org/debian stretch main" \
  && apt-get update \
  && apt-get install --assume-yes --no-install-recommends \
    docker-ce \
    ruby2.3 \
    mariadb-client \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN curl --silent --show-error https://s3.amazonaws.com/aws-cli/awscli-bundle.zip --output awscli-bundle.zip \
  && unzip awscli-bundle.zip \
  && ./awscli-bundle/install -i /usr/local/aws -b /usr/local/bin/aws \
  && rm -rf awscli-bundle awscli-bundle.zip

RUN gem install aws-sdk bundler dogapi unirest --no-document

RUN yarn global add gulp knex

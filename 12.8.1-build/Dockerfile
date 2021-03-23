FROM edvisorio/node:12.8.1

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
  && wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add - \
  && sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list' \
  && apt-get update \
  && apt-get install --assume-yes --no-install-recommends \
    docker-ce \
    google-chrome-stable \
    libmariadb-dev \
    mariadb-client \
    ruby2.3 \
    ruby2.3-dev \
    zlib1g-dev \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN curl --silent --show-error https://s3.amazonaws.com/aws-cli/awscli-bundle.zip --output awscli-bundle.zip \
  && unzip awscli-bundle.zip \
  && ./awscli-bundle/install -i /usr/local/aws -b /usr/local/bin/aws \
  && rm -rf awscli-bundle awscli-bundle.zip

RUN gem install aws-sdk bundler dogapi intercom mysql2 postmark unirest --no-document

RUN yarn global add gulp knex

ENV CHROME_BIN /usr/bin/google-chrome-stable


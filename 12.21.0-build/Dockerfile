FROM edvisorio/node:12.21.0

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update \
  && apt-get install --assume-yes --no-install-recommends \
    apt-transport-https \
    software-properties-common \
    unzip \
    gnupg \
    curl \
    wget \
  && curl --silent --show-error --location https://download.docker.com/linux/debian/gpg | apt-key add - \
  && add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/debian jessie stable" \
  && add-apt-repository "deb http://deb.debian.org/debian stretch main" \
  && wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add - \
  && sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list' \
  && apt-get update \
  && apt-get install --assume-yes --no-install-recommends \
    docker-ce \
    libmariadb-dev \
    mariadb-client \
    ruby2.3 \
    ruby2.3-dev \
    zlib1g-dev \
    imagemagick \
    python3 \
    jq \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN curl --silent --show-error https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip  --output awscli-v2.zip \
  && unzip awscli-v2.zip \
  && ./aws/install -i /usr/local/aws-cli -b /usr/local/bin \
  && rm -rf aws awscli-v2.zip

RUN gem install aws-sdk bundler dogapi intercom mysql2 postmark unirest --no-document

RUN yarn global add knex
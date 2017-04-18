FROM amazonlinux:latest

ENV NPM_CONFIG_LOGLEVEL warn

RUN curl --silent --location https://rpm.nodesource.com/setup_6.x | bash - \
  && curl --silent --output /etc/yum.repos.d/yarn.repo https://dl.yarnpkg.com/rpm/yarn.repo \
  && yum --assumeyes install \
    automake make gcc gcc-c++ python \
    git ssh yarn unzip zip \
    nodejs \
  && yum clean all

RUN curl --silent --show-error https://s3.amazonaws.com/aws-cli/awscli-bundle.zip --output awscli-bundle.zip \
  && unzip awscli-bundle.zip \
  && ./awscli-bundle/install -i /usr/local/aws -b /usr/local/bin/aws \
  && rm -rf awscli-bundle awscli-bundle.zip

RUN npm install --global node-gyp serverless

FROM amazonlinux:latest

ENV NPM_CONFIG_LOGLEVEL warn

RUN curl --silent --location https://rpm.nodesource.com/setup_4.x | bash - \
  && curl --silent --output /etc/yum.repos.d/yarn.repo https://dl.yarnpkg.com/rpm/yarn.repo \
  && yum --assumeyes install \
    automake make gcc gcc-c++ python \
    git ssh yarn zip \
    nodejs \
  && yum clean all

RUN npm install --global node-gyp

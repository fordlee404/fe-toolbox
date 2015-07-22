FROM ubuntu:14.04
MAINTAINER Ford Lee <fordlee404@gmail.com>
ENV REFRESHED_AT 2015-07-21

# Replace shell with bash so we can source files
RUN rm /bin/sh && ln -s /bin/bash /bin/sh

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get -yqq update
RUN apt-get -yqq install curl
RUN apt-get -yqq install python
RUN apt-get -yqq install make
RUN apt-get -yqq install gcc
RUN apt-get -yqq install build-essential
RUN apt-get -yqq install g++

# Setup home environment
RUN useradd dev
RUN mkdir /home/dev && chown -R dev: /home/dev
RUN mkdir -p /home/dev/bin /home/dev/lib /home/dev/include
ENV PATH /home/dev/bin:$PATH
ENV PKG_CONFIG_PATH /home/dev/lib/pkgconfig
ENV LD_LIBRARY_PATH /home/dev/lib

WORKDIR /home/dev
ENV HOME /home/dev
USER dev

ENV NVM_DIR $HOME/.nvm
ENV NODE_VERSION 0.10.32

# Install nvm with node and npm
RUN curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.25.4/install.sh | bash \
    && source $NVM_DIR/nvm.sh \
    && nvm install $NODE_VERSION \
    && nvm alias default $NODE_VERSION \
    && nvm use default

ENV NODE_PATH $NVM_DIR/v$NODE_VERSION/lib/node_modules
ENV PATH      $NVM_DIR/v$NODE_VERSION/bin:$PATH

RUN npm install -g yo
RUN npm install -g grunt-cli
RUN npm install -g bower
RUN npm install -g gulp
RUN npm install -g webpack
RUN npm install -g webpack-dev-server

# Setup dev environment
RUN mkdir /home/dev/share
VOLUME /home/dev/share
WORKDIR /home/dev/share

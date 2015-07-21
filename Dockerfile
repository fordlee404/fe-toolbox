FROM ubuntu:14.04
MAINTAINER Ford Lee <fordlee404@gmail.com>
ENV REFRESHED_AT 2015-07-18

# Replace shell with bash so we can source files
RUN rm /bin/sh && ln -s /bin/bash /bin/sh

RUN apt-get -yqq update
RUN apt-get -yqq install curl

ENV NVM_DIR $HOME/.nvm
ENV NODE_VERSION 0.10.22

# Install nvm with node and npm
RUN curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.25.4/install.sh | bash \
    && source $NVM_DIR/nvm.sh \
    && nvm install $NODE_VERSION \
    && nvm alias default $NODE_VERSION \
    && nvm use default

ENV NODE_PATH $NVM_DIR/v$NODE_VERSION/lib/node_modules
ENV PATH      $NVM_DIR/v$NODE_VERSION/bin:$PATH

RUN npm install -g yo grunt-cli bower gulp webpack

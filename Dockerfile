FROM node:0.12.7
MAINTAINER Ford Lee <fordlee404@gmail.com>

# Setup home environment
RUN mkdir /home/root && chmod -R 777 /home/root
ENV HOME /home/root
WORKDIR /home/root

# Add .bashrc file
RUN touch .bashrc

# Install packages
RUN apt-get update && apt-get install -y \
    apt-utils \
    curl \
    wget \
    make \
    g++ \
    python \
    ruby-full

RUN gem install compass

# Install nvm
RUN curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.26.1/install.sh | bash

RUN npm install -g yo
RUN npm install -g grunt-cli
RUN npm install -g bower
RUN npm install -g gulp
RUN npm install -g webpack
RUN npm install -g webpack-dev-server

# Setup dev environment
RUN mkdir /home/root/project
WORKDIR /home/root/project
VOLUME /home/root/project

CMD ["/bin/bash"]

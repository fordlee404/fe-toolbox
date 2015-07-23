FROM node:0.10.40
MAINTAINER Ford Lee <fordlee404@gmail.com>
ENV REFRESHED_AT 2015-07-22

ENV DEBIAN_FRONTEND noninteractive
ENV USER root

RUN npm install -g yo
RUN npm install -g grunt-cli
RUN npm install -g bower
RUN npm install -g gulp
RUN npm install -g webpack
RUN npm install -g webpack-dev-server

# Setup home environment
RUN useradd dev
RUN mkdir /home/dev && chown -R dev: /home/dev

WORKDIR /home/dev
ENV HOME /home/dev

USER dev

# Setup dev environment
RUN mkdir /home/dev/share
VOLUME /home/dev/share
WORKDIR /home/dev/share

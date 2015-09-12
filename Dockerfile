FROM node:4.0.0
MAINTAINER Ford Lee <fordlee404@gmail.com>

# Setup home environment
RUN mkdir /home/root && chmod -R 777 /home/root
ENV HOME /home/root
WORKDIR /home/root

RUN apt-get update && apt-get install -y \
    make \
    python \
    g++ \
    ruby-full

RUN gem update --system
RUN gem install compass

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

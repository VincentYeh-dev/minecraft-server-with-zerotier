FROM itzg/minecraft-server:latest
MAINTAINER VincentYeh-dev

RUN apt-get update
RUN apt-get install curl gnupg net-tools iputils-ping -y

RUN curl https://install.zerotier.com/ | bash

ADD start-zerotier-server /start-zerotier-server
RUN chmod +x /start-zerotier-server

ENTRYPOINT /start-zerotier-server

FROM itzg/minecraft-server:latest
MAINTAINER VincentYeh-dev

RUN apt-get update
RUN apt-get install curl gnupg net-tools iputils-ping -y

RUN curl https://install.zerotier.com/ | bash

ADD start-zerotier /start-zerotier
RUN chmod +x /start-zerotier

ADD startup /startup
RUN chmod +x /startup

ENTRYPOINT /startup

FROM itzg/minecraft-server:latest
MAINTAINER VincentYeh-dev

RUN apt-get update
RUN apt-get install curl gnupg net-tools iputils-ping -y

RUN curl https://install.zerotier.com/ | bash

ADD start-zero-tier.sh /start-zero-tier.sh
RUN chmod +x /start-zero-tier.sh

CMD ["echo", "AAA"]

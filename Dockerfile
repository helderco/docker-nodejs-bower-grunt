FROM node:0.12-slim
MAINTAINER Helder Correia <me@heldercorreia.com>

# add our user and group first to make sure their IDs get assigned consistently, regardless of whatever dependencies get added
RUN groupadd node && useradd -m -g node node

# grab gosu for easy step-down from root
RUN gpg --keyserver pool.sks-keyservers.net --recv-keys B42F6819007F00F88E364FD4036A9C25BF357DD4
RUN apt-get update && apt-get install -y --no-install-recommends ca-certificates wget && rm -rf /var/lib/apt/lists/* \
    && wget -O /usr/local/bin/gosu "https://github.com/tianon/gosu/releases/download/1.2/gosu-$(dpkg --print-architecture)" \
    && wget -O /usr/local/bin/gosu.asc "https://github.com/tianon/gosu/releases/download/1.2/gosu-$(dpkg --print-architecture).asc" \
    && gpg --verify /usr/local/bin/gosu.asc \
    && rm /usr/local/bin/gosu.asc \
    && chmod +x /usr/local/bin/gosu \
    && apt-get purge -y --auto-remove ca-certificates wget

# git is usually needed
RUN apt-get update && \
    apt-get install git --no-install-recommends -y && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# install bower and grunt
RUN npm install -g bower grunt-cli

# silence usage statistics question in bower
RUN mkdir -p /home/node/.config/configstore && \
    echo "optOut: true" > /home/node/.config/configstore/insight-bower.yml && \
    chown -R node:node /home/node

WORKDIR /data
CMD ["node"]

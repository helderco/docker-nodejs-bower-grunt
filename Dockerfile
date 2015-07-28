FROM node:0.12-slim
MAINTAINER Helder Correia <me@heldercorreia.com>

# git is usually needed
RUN apt-get update && \
    apt-get install git --no-install-recommends -y && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# install bower and grunt
RUN npm install -g bower grunt-cli

# silence usage statistics question in bower
RUN mkdir -p /root/.config/configstore && \
    echo "optOut: true" > /root/.config/configstore/insight-bower.yml

WORKDIR /data
CMD ["bash"]

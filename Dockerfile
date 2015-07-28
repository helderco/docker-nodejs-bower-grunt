FROM node:0.12-slim
MAINTAINER Helder Correia <me@heldercorreia.com>

RUN npm install -g bower grunt-cli

WORKDIR /data
ENTRYPOINT ["bash"]

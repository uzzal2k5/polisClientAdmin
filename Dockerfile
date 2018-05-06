FROM ubuntu:16.04
MAINTAINER uzzal, uzzal2k5@gmail.com
WORKDIR /ClientAdmin
RUN rm /bin/sh && ln -s /bin/bash /bin/sh
# nvm environment variables
ENV NVM_DIR .nvm
ENV NODE_VERSION 6.10.3
## install nvm
RUN curl https://raw.githubusercontent.com/creationix/nvm/v0.25.0/install.sh | bash
## install node and npm
RUN source $NVM_DIR/nvm.sh \
    && nvm install $NODE_VERSION \
    && nvm alias default $NODE_VERSION \
    && nvm use default
## add node and npm to path so the commands are available
ENV NODE_PATH $NVM_DIR/v$NODE_VERSION/lib/node_modules
ENV PATH $NVM_DIR/versions/node/v$NODE_VERSION/bin:$PATH
#
ADD polisClientAdmin ./
# Adding source code
ADD polisClientAdmin ./

# working with package.json
COPY yarn.sh ./
RUN chmod a+x yarn.sh && sh  yarn.sh
RUN cd polisClientAdmin && yarn install
# Install bower
#RUN cd polisClientAdmin && npm install -g bower d3@3.0.8
#RUN bower install d3@3.0.8 --config.interactive=false --allow-root
# Install PGSQL Client
COPY pgsql-client.sh ./
RUN chmod a+x pgsql-client.sh && sh pgsql-client.sh

# Exposing port to connect from polisServer

EXPOSE 5002


ENTRYPOINT ["sh","x"]
FROM node:6
MAINTAINER uzzal, uzzal2k5@gmail.com
WORKDIR /server
RUN rm /bin/sh && ln -s /bin/bash /bin/sh
# nvm environment variables
ENV NVM_DIR /usr/local/nvm
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
RUN npm install
RUN source ~/.bashrc
RUN source ~/.profile
#RUN nvm use 6.2.0
#RUN npm start



#ENTRYPOINT ["polisClientAdmin/x"]
FROM uzzal2k5/node-ubuntu:8.11.1
MAINTAINER uzzal, uzzal2k5@gmail.com, https://github.com/uzzal2k5
WORKDIR /clientadmin
# Install pgsql client
COPY pgsql-client.sh ./
RUN chmod a+x pgsql-client.sh && sh pgsql-client.sh
# Git client
RUN apt-get install -y git

# Adding source code
ADD polisClientAdmin ./

# Installing node packages
RUN npm install --unsafe-perm

# Copying configuration
COPY polis.config ./

# Exposing port to communicate
EXPOSE 5002

# Running Scripts
ENTRYPOINT ["sh","x"]
FROM uzzal2k5/node-ubuntu:8.11.1
MAINTAINER uzzal, uzzal2k5@gmail.com, https://github.com/uzzal2k5
WORKDIR /clientadmin
# Install pgsql client
COPY pgsql-client.sh ./
RUN chmod a+x pgsql-client.sh && sh pgsql-client.sh

RUN apt-get install -y git

# Adding source code
ADD polisClientAdmin ./

RUN npm install --unsafe-perm

COPY polis.config ./
EXPOSE 5002


ENTRYPOINT ["sh","x"]
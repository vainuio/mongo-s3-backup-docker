FROM ubuntu:18.04
RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get upgrade -y && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
    ca-certificates \
    s3cmd \
    mbuffer \
    xz-utils \
    liblz4-tool \
    curl \
    awscli && apt-get clean
ENV MONGO_MAJOR 4.0
RUN curl https://www.mongodb.org/static/pgp/server-$MONGO_MAJOR.pub -o /etc/apt/trusted.gpg.d/mongo-keyring.gpg
RUN echo "deb http://repo.mongodb.org/apt/ubuntu xenial/mongodb-org/$MONGO_MAJOR multiverse" | tee "/etc/apt/sources.list.d/mongodb.list"
RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y \
    mongodb-org-shell \
    mongodb-org-tools && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

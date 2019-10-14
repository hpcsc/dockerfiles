ARG BASE_TAG
FROM mcr.microsoft.com/dotnet/core/sdk:${BASE_TAG}
ARG TAG

LABEL image=hpcsc/dotnet-sdk-dockerize
LABEL version=${TAG}

RUN apk add --no-cache openssl

ARG DOCKERIZE_VERSION
RUN wget https://github.com/jwilder/dockerize/releases/download/$DOCKERIZE_VERSION/dockerize-alpine-linux-amd64-$DOCKERIZE_VERSION.tar.gz \
    && tar -C /usr/local/bin -xzvf dockerize-alpine-linux-amd64-$DOCKERIZE_VERSION.tar.gz \
    && rm dockerize-alpine-linux-amd64-$DOCKERIZE_VERSION.tar.gz

FROM alpine:3.11
LABEL image=hpcsc/alpine-jq
LABEL version=0.1.0

WORKDIR /app

RUN apk add --no-cache jq

ENTRYPOINT ["jq"]

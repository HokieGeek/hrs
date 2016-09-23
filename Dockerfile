FROM alpine:latest

RUN apk add --no-cache bash

ADD hrs /usr/bin/hrs

ENTRYPOINT ["/usr/bin/hrs"]

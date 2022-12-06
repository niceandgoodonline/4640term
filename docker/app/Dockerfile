FROM python:alpine3.16

COPY ./entrypoint.sh /tmp/entrypoint.sh

RUN apk update \
&& apk add --no-cache aws-cli jq bash

ENTRYPOINT ["/tmp/entrypoint.sh"]

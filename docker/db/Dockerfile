FROM ubuntu/mysql

COPY ./entrypoint.sh /tmp/entrypoint.sh

RUN apt-get update \
&& apt-get install -y awscli \
&& apt-get clean

ENTRYPOINT ["/tmp/entrypoint.sh"]

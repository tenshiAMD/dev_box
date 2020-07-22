ARG MYSQL_VERSION=latest

FROM mysql:${MYSQL_VERSION}

ENV MYSQL_PORT 3306

LABEL maintainer="Angel Aviel Domaoan <dev.tenshiamd@gmail.com>"

COPY ./bin/* /usr/local/bin/
RUN cd /usr/local/bin && chmod 750 docker-healthcheck.sh

HEALTHCHECK CMD ["docker-healthcheck.sh"]

EXPOSE $MYSQL_PORT

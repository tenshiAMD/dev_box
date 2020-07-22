ARG PG_VERSION=latest

FROM sameersbn/postgresql:${PG_VERSION}

LABEL maintainer="Angel Aviel Domaoan <dev.tenshiamd@gmail.com>"

ENV PG_PORT 5432

## Installs `dockerize`
RUN apt-get update && apt-get install -y wget
ENV DOCKERIZE_VERSION v0.6.1
RUN wget https://github.com/jwilder/dockerize/releases/download/$DOCKERIZE_VERSION/dockerize-linux-amd64-$DOCKERIZE_VERSION.tar.gz \
    && tar -C /usr/local/bin -xzvf dockerize-linux-amd64-$DOCKERIZE_VERSION.tar.gz \
    && rm dockerize-linux-amd64-$DOCKERIZE_VERSION.tar.gz

COPY ./bin/* /usr/local/bin/
RUN cd /usr/local/bin && chmod 750 docker-entrypoint.sh
RUN cd /usr/local/bin && chmod 750 docker-healthcheck.sh

COPY ./postgresql.conf.tmpl /etc/postgresql/${PG_VERSION}/main/postgresql.conf.tmpl

HEALTHCHECK --start-period=180s CMD ["docker-healthcheck.sh"] 

ENTRYPOINT ["docker-entrypoint.sh"]

WORKDIR $PG_DATADIR

EXPOSE $PG_PORT

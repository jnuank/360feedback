FROM postgres:alpine3.15

RUN mkdir /init-data-files
COPY init.sh /docker-entrypoint-initdb.d/
COPY data /init-data-files
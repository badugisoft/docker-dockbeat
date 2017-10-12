FROM alpine:3.5

COPY ./dockbeat.yml /etc/dockbeat/dockbeat.yml
COPY ./bin/dockbeat /usr/local/bin/dockbeat

WORKDIR /etc/dockbeat
ENTRYPOINT dockbeat

CMD [ "-c", "dockbeat.yml", "-e" ]

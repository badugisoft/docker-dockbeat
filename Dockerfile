FROM golang:1.7-alpine

RUN apk add --update --no-cache bash python git make g++ &&\
    cd /tmp &&\
    wget http://pyyaml.org/download/pyyaml/PyYAML-3.11.tar.gz &&\
    tar -zxvf PyYAML-3.11.tar.gz &&\
    cd /tmp/PyYAML-3.11 &&\
    python setup.py install &&\
    go get github.com/Masterminds/glide &&\
    git clone https://github.com/Ingensi/dockbeat.git $GOPATH/src/github.com/ingensi/dockbeat &&\
    cd $GOPATH/src/github.com/ingensi/dockbeat &&\
    git checkout tags/v1.0.0 &&\
    make && make &&\
    mkdir -p /etc/dockbeat/ &&\
    cp $GOPATH/src/github.com/ingensi/dockbeat/dockbeat /usr/local/bin/dockbeat &&\
    rm -rf $GOPATH &&\
    rm -rf /tmp/PyYAML-3.11 &&\
    apk del python git make g++

COPY ./dockbeat.yml /etc/dockbeat/dockbeat.yml

WORKDIR /etc/dockbeat
ENTRYPOINT dockbeat

CMD [ "-c", "dockbeat.yml", "-e" ]

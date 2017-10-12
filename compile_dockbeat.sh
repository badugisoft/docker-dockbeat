#!/bin/sh

# install reqired packages
apk add --update --no-cache \
    bash python git make g++

# install PyYAML
cd /tmp
wget http://pyyaml.org/download/pyyaml/PyYAML-3.11.tar.gz
tar -zxvf PyYAML-3.11.tar.gz
cd /tmp/PyYAML-3.11
python setup.py install

# install glide
go get github.com/Masterminds/glide

# compile dockbeat
git clone https://github.com/Ingensi/dockbeat.git $GOPATH/src/github.com/ingensi/dockbeat
cd $GOPATH/src/github.com/ingensi/dockbeat
git checkout tags/v1.0.0
make && make

# copy output
cp $GOPATH/src/github.com/ingensi/dockbeat/dockbeat /work/bin/dockbeat

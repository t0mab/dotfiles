#! /bin/bash

set -e

[ ! -d ~/go/.git ] && git clone https://go.googlesource.com/go ~/go

cd ~/go && git fetch && git checkout go1.4.2
cd ~/go/src && ./all.bash

[ ! -d ~/Go ] && mkdir ~/Go

GOPATH=~/Go ~/go/bin/go get -v -u code.google.com/p/go.tools/cmd/goimports
GOPATH=~/Go ~/go/bin/go get -v -u code.google.com/p/go.tools/cmd/oracle
GOPATH=~/Go ~/go/bin/go get -v -u code.google.com/p/rog-go/exp/cmd/godef
GOPATH=~/Go ~/go/bin/go get -v -u github.com/coreos/etcd-ca
GOPATH=~/Go ~/go/bin/go get -v -u github.com/golang/lint/golint
GOPATH=~/Go ~/go/bin/go get -v -u github.com/jstemmer/gotags
GOPATH=~/Go ~/go/bin/go get -v -u github.com/kisielk/errcheck
GOPATH=~/Go ~/go/bin/go get -v -u github.com/lib/pq
GOPATH=~/Go ~/go/bin/go get -v -u github.com/mrjones/oauth
GOPATH=~/Go ~/go/bin/go get -v -u github.com/streadway/amqp
GOPATH=~/Go ~/go/bin/go get -v -u github.com/voxelbrain/goptions
GOPATH=~/Go ~/go/bin/go get -v -u golang.org/x/tools/cmd/benchcmp
GOPATH=~/Go ~/go/bin/go get -v -u golang.org/x/tools/cmd/godoc
GOPATH=~/Go ~/go/bin/go get -v -u golang.org/x/tools/cmd/gorename
GOPATH=~/Go ~/go/bin/go get -v -u golang.org/x/tools/cmd/vet
GOPATH=~/Go ~/go/bin/go get -v -u gopkg.in/mgo.v2

#! /bin/bash

set -e

. ../helpers.sh

export GOROOT_BOOTSTRAP=/usr/lib/go

# MacOS (homebrew)
[ -d /usr/local/opt/go ] && export GOROOT_BOOTSTRAP=/usr/local/Cellar/go/1.5/libexec

#git clone https://go.googlesource.com/go ~/go &&
cd ~/go/src && git checkout go1.5 && ./all.bash

[ ! -d ~/Go ] && mkdir ~/Go

GOPATH=~/Go ~/go/bin/go get -v -u code.google.com/p/rog-go/exp/cmd/godef
GOPATH=~/Go ~/go/bin/go get -v -u github.com/coreos/etcd-ca
GOPATH=~/Go ~/go/bin/go get -v -u github.com/golang/lint/golint
GOPATH=~/Go ~/go/bin/go get -v -u github.com/jstemmer/gotags
GOPATH=~/Go ~/go/bin/go get -v -u github.com/kisielk/errcheck
GOPATH=~/Go ~/go/bin/go get -v -u github.com/lib/pq
GOPATH=~/Go ~/go/bin/go get -v -u github.com/mrjones/oauth
GOPATH=~/Go ~/go/bin/go get -v -u github.com/nsf/gocode
GOPATH=~/Go ~/go/bin/go get -v -u github.com/schachmat/wego
GOPATH=~/Go ~/go/bin/go get -v -u github.com/spf13/hugo
GOPATH=~/Go ~/go/bin/go get -v -u github.com/streadway/amqp
GOPATH=~/Go ~/go/bin/go get -v -u github.com/voxelbrain/goptions
GOPATH=~/Go ~/go/bin/go get -v -u golang.org/x/tools/cmd/benchcmp
GOPATH=~/Go ~/go/bin/go get -v -u golang.org/x/tools/cmd/godoc
GOPATH=~/Go ~/go/bin/go get -v -u golang.org/x/tools/cmd/goimports
GOPATH=~/Go ~/go/bin/go get -v -u golang.org/x/tools/cmd/gorename
GOPATH=~/Go ~/go/bin/go get -v -u golang.org/x/tools/cmd/vet
GOPATH=~/Go ~/go/bin/go get -v -u golang.org/x/tools/oracle
GOPATH=~/Go ~/go/bin/go get -v -u gopkg.in/mgo.v2

# Go go Vegeta !
GOPATH=~/Go ~/go/bin/go get -v -u github.com/tsenart/vegeta
GOPATH=~/Go ~/go/bin/go install -v github.com/tsenart/vegeta

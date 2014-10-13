[ ! -d ~/go/.hg ] && hg clone -u release https://code.google.com/p/go ~/go

cd ~/go && hg update release
cd ~/go/src && ./all.bash

[ ! -d ~/Go ] && mkdir ~/Go

GOPATH=~/Go ~/go/bin/go get -v -u code.google.com/p/go.tools/cmd/godoc
GOPATH=~/Go ~/go/bin/go get -v -u code.google.com/p/go.tools/cmd/goimports
GOPATH=~/Go ~/go/bin/go get -v -u code.google.com/p/go.tools/cmd/vet
GOPATH=~/Go ~/go/bin/go get -v -u github.com/jstemmer/gotags
GOPATH=~/Go ~/go/bin/go get -v -u github.com/lib/pq
GOPATH=~/Go ~/go/bin/go get -v -u github.com/nsf/gocode
GOPATH=~/Go ~/go/bin/go get -v -u github.com/streadway/amqp
GOPATH=~/Go ~/go/bin/go get -v -u github.com/voxelbrain/goptions
GOPATH=~/Go ~/go/bin/go get -v -u labix.org/v2/mgo

[ ! -d ~/go/.hg ] && hg clone -u release https://code.google.com/p/go ~/go

cd ~/go && hg update release
cd ~/go/src && ./all.bash

[ ! -d ~/Go ] && mkdir ~/Go

GOPATH=~/Go ~/go/bin/go get github.com/jstemmer/gotags
GOPATH=~/Go ~/go/bin/go get github.com/lib/pq
GOPATH=~/Go ~/go/bin/go get github.com/nsf/gocode
GOPATH=~/Go ~/go/bin/go get github.com/voxelbrain/goptions
GOPATH=~/Go ~/go/bin/go get labix.org/v2/mgo

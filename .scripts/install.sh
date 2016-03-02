#! /bin/bash

set -e

# sudo pacman -Syu && sudo pacman --needed --noconfirm -S \
# 	go

export GOPATH="$HOME/Go"

GO_REPOS="\
	github.com/golang/lint/golint \
	github.com/jstemmer/gotags \
	github.com/kisielk/errcheck \
	github.com/lib/pq \
	github.com/nsf/gocode \
	github.com/rogpeppe/godef \
	golang.org/x/tools/cmd/benchcmp \
	golang.org/x/tools/cmd/goimports \
	golang.org/x/tools/cmd/gorename \
	golang.org/x/tools/cmd/vet \
	golang.org/x/tools/oracle \
"

for repos in $GO_REPOS; do
	echo "Installing $repos ..."
	go get -u $repos
done

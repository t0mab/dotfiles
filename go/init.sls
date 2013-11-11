golang:
  hg.latest:
    - name: https://code.google.com/p/go
    - rev: release
    - target: /home/fabien/go
    - user: fabien
  cmd.wait:
    - name: ./all.bash
    - cwd: /home/fabien/go/src
    - watch:
      - hg: golang

go get -u github.com/nsf/gocode:
  cmd.run:
    - user: fabien
    - env:
      - GOPATH: /home/fabien/Go
      - PATH: {{ grains['path'] }}:/home/fabien/go/bin

go get -u github.com/jstemmer/gotags:
  cmd.run:
    - user: fabien
    - env:
      - GOPATH: /home/fabien/Go
      - PATH: {{ grains['path'] }}:/home/fabien/go/bin

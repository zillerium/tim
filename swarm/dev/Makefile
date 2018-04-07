.PHONY: build cluster test

default: build

build:
	go build -o bin/swarm    github.com/tim-coin/tim/cmd/swarm
	go build -o bin/geth     github.com/tim-coin/tim/cmd/geth
	go build -o bin/bootnode github.com/tim-coin/tim/cmd/bootnode

cluster: build
	scripts/boot-cluster.sh

test:
	go test -v github.com/tim-coin/tim/swarm/...

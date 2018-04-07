# This Makefile is meant to be used by people that do not usually work
# with Go source code. If you know what GOPATH is then you probably
# don't need to bother with make.

.PHONY: timd android ios timd-cross swarm evm all test clean
.PHONY: timd-linux timd-linux-386 timd-linux-amd64 timd-linux-mips64 timd-linux-mips64le
.PHONY: timd-linux-arm timd-linux-arm-5 timd-linux-arm-6 timd-linux-arm-7 timd-linux-arm64
.PHONY: timd-darwin timd-darwin-386 timd-darwin-amd64
.PHONY: timd-windows timd-windows-386 timd-windows-amd64

GOBIN = $(shell pwd)/build/bin
GO ?= latest

timd:
	build/env.sh go run build/ci.go install ./cmd/timd
	@echo "Done building."
	@echo "Run \"$(GOBIN)/timd\" to launch timd."

swarm:
	build/env.sh go run build/ci.go install ./cmd/swarm
	@echo "Done building."
	@echo "Run \"$(GOBIN)/swarm\" to launch swarm."

all:
	build/env.sh go run build/ci.go install

android:
	build/env.sh go run build/ci.go aar --local
	@echo "Done building."
	@echo "Import \"$(GOBIN)/timd.aar\" to use the library."

ios:
	build/env.sh go run build/ci.go xcode --local
	@echo "Done building."
	@echo "Import \"$(GOBIN)/timd.framework\" to use the library."

test: all
	build/env.sh go run build/ci.go test

clean:
	rm -fr build/_workspace/pkg/ $(GOBIN)/*

# The devtools target installs tools required for 'go generate'.
# You need to put $GOBIN (or $GOPATH/bin) in your PATH to use 'go generate'.

devtools:
	env GOBIN= go get -u golang.org/x/tools/cmd/stringer
	env GOBIN= go get -u github.com/jteeuwen/go-bindata/go-bindata
	env GOBIN= go get -u github.com/fjl/gencodec
	env GOBIN= go install ./cmd/abigen

# Cross Compilation Targets (xgo)

timd-cross: timd-linux timd-darwin timd-windows timd-android timd-ios
	@echo "Full cross compilation done:"
	@ls -ld $(GOBIN)/timd-*

timd-linux: timd-linux-386 timd-linux-amd64 timd-linux-arm timd-linux-mips64 timd-linux-mips64le
	@echo "Linux cross compilation done:"
	@ls -ld $(GOBIN)/timd-linux-*

timd-linux-386:
	build/env.sh go run build/ci.go xgo -- --go=$(GO) --targets=linux/386 -v ./cmd/timd
	@echo "Linux 386 cross compilation done:"
	@ls -ld $(GOBIN)/timd-linux-* | grep 386

timd-linux-amd64:
	build/env.sh go run build/ci.go xgo -- --go=$(GO) --targets=linux/amd64 -v ./cmd/timd
	@echo "Linux amd64 cross compilation done:"
	@ls -ld $(GOBIN)/timd-linux-* | grep amd64

timd-linux-arm: timd-linux-arm-5 timd-linux-arm-6 timd-linux-arm-7 timd-linux-arm64
	@echo "Linux ARM cross compilation done:"
	@ls -ld $(GOBIN)/timd-linux-* | grep arm

timd-linux-arm-5:
	build/env.sh go run build/ci.go xgo -- --go=$(GO) --targets=linux/arm-5 -v ./cmd/timd
	@echo "Linux ARMv5 cross compilation done:"
	@ls -ld $(GOBIN)/timd-linux-* | grep arm-5

timd-linux-arm-6:
	build/env.sh go run build/ci.go xgo -- --go=$(GO) --targets=linux/arm-6 -v ./cmd/timd
	@echo "Linux ARMv6 cross compilation done:"
	@ls -ld $(GOBIN)/timd-linux-* | grep arm-6

timd-linux-arm-7:
	build/env.sh go run build/ci.go xgo -- --go=$(GO) --targets=linux/arm-7 -v ./cmd/timd
	@echo "Linux ARMv7 cross compilation done:"
	@ls -ld $(GOBIN)/timd-linux-* | grep arm-7

timd-linux-arm64:
	build/env.sh go run build/ci.go xgo -- --go=$(GO) --targets=linux/arm64 -v ./cmd/timd
	@echo "Linux ARM64 cross compilation done:"
	@ls -ld $(GOBIN)/timd-linux-* | grep arm64

timd-linux-mips:
	build/env.sh go run build/ci.go xgo -- --go=$(GO) --targets=linux/mips --ldflags '-extldflags "-static"' -v ./cmd/timd
	@echo "Linux MIPS cross compilation done:"
	@ls -ld $(GOBIN)/timd-linux-* | grep mips

timd-linux-mipsle:
	build/env.sh go run build/ci.go xgo -- --go=$(GO) --targets=linux/mipsle --ldflags '-extldflags "-static"' -v ./cmd/timd
	@echo "Linux MIPSle cross compilation done:"
	@ls -ld $(GOBIN)/timd-linux-* | grep mipsle

timd-linux-mips64:
	build/env.sh go run build/ci.go xgo -- --go=$(GO) --targets=linux/mips64 --ldflags '-extldflags "-static"' -v ./cmd/timd
	@echo "Linux MIPS64 cross compilation done:"
	@ls -ld $(GOBIN)/timd-linux-* | grep mips64

timd-linux-mips64le:
	build/env.sh go run build/ci.go xgo -- --go=$(GO) --targets=linux/mips64le --ldflags '-extldflags "-static"' -v ./cmd/timd
	@echo "Linux MIPS64le cross compilation done:"
	@ls -ld $(GOBIN)/timd-linux-* | grep mips64le

timd-darwin: timd-darwin-386 timd-darwin-amd64
	@echo "Darwin cross compilation done:"
	@ls -ld $(GOBIN)/timd-darwin-*

timd-darwin-386:
	build/env.sh go run build/ci.go xgo -- --go=$(GO) --targets=darwin/386 -v ./cmd/timd
	@echo "Darwin 386 cross compilation done:"
	@ls -ld $(GOBIN)/timd-darwin-* | grep 386

timd-darwin-amd64:
	build/env.sh go run build/ci.go xgo -- --go=$(GO) --targets=darwin/amd64 -v ./cmd/timd
	@echo "Darwin amd64 cross compilation done:"
	@ls -ld $(GOBIN)/timd-darwin-* | grep amd64

timd-windows: timd-windows-386 timd-windows-amd64
	@echo "Windows cross compilation done:"
	@ls -ld $(GOBIN)/timd-windows-*

timd-windows-386:
	build/env.sh go run build/ci.go xgo -- --go=$(GO) --targets=windows/386 -v ./cmd/timd
	@echo "Windows 386 cross compilation done:"
	@ls -ld $(GOBIN)/timd-windows-* | grep 386

timd-windows-amd64:
	build/env.sh go run build/ci.go xgo -- --go=$(GO) --targets=windows/amd64 -v ./cmd/timd
	@echo "Windows amd64 cross compilation done:"
	@ls -ld $(GOBIN)/timd-windows-* | grep amd64

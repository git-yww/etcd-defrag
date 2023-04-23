
all: build

.PHONY: build
build:
	GO_BUILD_FLAGS="${GO_BUILD_FLAGS} -v -mod=readonly" ./build.sh


GOFILES = $(shell find . -name \*.go)

.PHONY: fmt
fmt:
	@echo "Verifying gofmt"
	@!(gofmt -l -s -d ${GOFILES} | grep '[a-z]')

	@echo "Verifying goimports"
	@!(go run golang.org/x/tools/cmd/goimports@latest -l -d ${GOFILES} | grep '[a-z]')

.PHONY: lint
lint:
	golangci-lint run ./...


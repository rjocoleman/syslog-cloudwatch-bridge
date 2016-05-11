.PHONY: build linux clean

all: build

build:
	go build

linux: *.go
	CGO_ENABLED=0 GOOS=linux go build -a -tags netgo -ldflags '-w' .

clean:
	rm -f syslog-cloudwatch-bridge

release: linux
	docker build -t rjocoleman/syslog-cloudwatch-bridge .
	docker push rjocoleman/syslog-cloudwatch-bridge

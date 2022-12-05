BUILD_OPTS=
DOCKER=docker run -t -u "`id -u`:`id -g`" -v $(PWD):/v -w /v --rm crystallang/crystal:1.6.2-alpine

all: build

build:
	$(DOCKER) shards build --link-flags "-static" $(BUILD_OPTS) $(O)

release: BUILD_OPTS=--release
release: build

.PHONY : test
test:
	[ -f bin/align-equals ] || make build
	@./test/run

clean:
	rm -rf bin .crystal tmp

version:
	sed -i -e 's/^version: .*/version: $(VERSION)/' shard.yml
	git commit -a -m 'version: $(VERSION)'
	git tag "v$(VERSION)"

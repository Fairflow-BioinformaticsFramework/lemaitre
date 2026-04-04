name = ghcr.io/fairflow-bioinformaticsframework/lemaitre
build-arg := $(shell git describe --exact-match --tags 2> /dev/null || git rev-parse --short HEAD)
build:
	docker buildx build \
		--platform linux/amd64,linux/arm64 \
		--build-arg GIT_REVISION=$(build-arg) \
		-t $(name):$(build-arg) \
		--push \
		.
	echo $(name):$(build-arg)


all: build

build:
	@docker build --rm -t swift.local .

run:
	@docker run -it swift.local

runshell:
	@docker run --entrypoint=/bin/bash -it swift.local

# remove the doc folder
clean:
	@docker rmi -f swift.local

.PHONY: build
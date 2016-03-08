# swift-docker
docker container with swift 3

## setup
docker setup with something like [docker-machine](https://docs.docker.com/machine/install-machine/)

## build
```bash
docker build --rm -t swift.local .
```
or Makefile
```bash
make build
```

## run
```bash
docker run -it swift.local
```
or Makefile
```bash
make run
```

## run with shell
```bash
docker run --entrypoint=/bin/bash -it swift.local
```
or Makefile
```bash
make runshell
```
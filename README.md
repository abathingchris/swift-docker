# swift-docker
docker container with swift 3

## build
```bash
docker build --rm -t swift.local .
```

## run
```bash
docker run -it swift.local
```

## run with shell
```bash
docker run --entrypoint=/bin/bash -it swift.local
```
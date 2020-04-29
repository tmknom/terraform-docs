# terraform-docs

[![CircleCI](https://circleci.com/gh/tmknom/terraform-docs.svg?style=svg)](https://circleci.com/gh/tmknom/terraform-docs)
[![Docker Build Status](https://img.shields.io/docker/build/tmknom/terraform-docs.svg)](https://hub.docker.com/r/tmknom/terraform-docs/builds/)
[![Docker Automated build](https://img.shields.io/docker/automated/tmknom/terraform-docs.svg)](https://hub.docker.com/r/tmknom/terraform-docs/)
[![MicroBadger Size](https://img.shields.io/microbadger/image-size/tmknom/terraform-docs.svg)](https://microbadger.com/images/tmknom/terraform-docs)
[![MicroBadger Layers](https://img.shields.io/microbadger/layers/tmknom/terraform-docs.svg)](https://microbadger.com/images/tmknom/terraform-docs)
[![License](https://img.shields.io/github/license/tmknom/terraform-docs.svg)](https://opensource.org/licenses/Apache-2.0)

Generate docs from terraform modules based on Docker.

This is [terraform-docs](https://github.com/segmentio/terraform-docs) wrapper.

## Requirements

- [Docker](https://www.docker.com/)

## Usage

### Basic

```sh
docker run --rm -v "$PWD:/work" tmknom/terraform-docs
```

### Specific directory

```sh
docker run --rm -v "$PWD:/work" tmknom/terraform-docs markdown /path/to/dir
```

### Help

For details, refer to [segmentio/terraform-docs](https://github.com/segmentio/terraform-docs).

```sh
docker run --rm tmknom/terraform-docs --help
```

## Makefile targets

```text
build                          Build docker image
format                         Format code
help                           Show help
install                        Install requirements
lint                           Lint code
release                        Release
```

## Development

### Installation

```shell
git clone git@github.com:tmknom/terraform-docs.git
cd terraform-docs
make install
```

### Deployment

1. Bump [VERSION](https://raw.githubusercontent.com/tmknom/terraform-docs/master/VERSION) file.
2. Run `make release`.
3. Automatically deployed by "[Docker Hub Automated Build](https://docs.docker.com/docker-hub/builds/)".

### Deployment Pipeline

1. GitHub - Version Control System
   - <https://github.com/tmknom/terraform-docs>
2. GitHub Actions - Continuous Integration
   - <https://github.com/tmknom/terraform-docs/actions>
3. Docker Hub - Docker Registry
   - <https://hub.docker.com/r/tmknom/terraform-docs>
4. MicroBadger - Docker Inspection
   - <https://microbadger.com/images/tmknom/terraform-docs>

## License

Apache 2 Licensed. See LICENSE for full details.

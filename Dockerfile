ARG PACKAGE_PATH="github.com/segmentio/terraform-docs"

FROM golang:alpine AS builder

ARG PACKAGE_PATH
ARG PACKAGE_VERSION="0.5.0"

# https://docs.docker.com/develop/develop-images/multistage-build/#use-multi-stage-builds
# https://stackoverflow.com/questions/24855081/how-do-i-import-a-specific-version-of-a-package-using-go-get
# hadolint ignore=DL3003
RUN set -x && \
    apk add --no-cache git=2.24.3-r0&& \
    go get -d -v ${PACKAGE_PATH} && \
    cd /go/src/${PACKAGE_PATH} && \
    git checkout -b ${PACKAGE_VERSION} refs/tags/v${PACKAGE_VERSION} && \
    CGO_ENABLED=0 GOOS=linux go build -a -installsuffix cgo -ldflags="-s -w -X main.version=${PACKAGE_VERSION}" ${PACKAGE_PATH}


FROM scratch

# Build-time metadata as defined at http://label-schema.org
ARG BUILD_DATE
ARG VCS_REF
ARG VERSION
ARG REPO_NAME
LABEL org.label-schema.vendor="tmknom" \
      org.label-schema.name=$REPO_NAME \
      org.label-schema.description="Generate docs from terraform modules." \
      org.label-schema.build-date=$BUILD_DATE \
      org.label-schema.version=$VERSION \
      org.label-schema.vcs-ref=$VCS_REF \
      org.label-schema.vcs-url="https://github.com/$REPO_NAME" \
      org.label-schema.usage="https://github.com/$REPO_NAME/blob/master/README.md#usage" \
      org.label-schema.docker.cmd="docker run --rm -v \$PWD:/work $REPO_NAME" \
      org.label-schema.schema-version="1.0"

ARG PACKAGE_PATH
COPY --from=builder /go/src/${PACKAGE_PATH}/terraform-docs /terraform-docs

WORKDIR /work
ENTRYPOINT ["/terraform-docs"]
CMD ["markdown", "."]

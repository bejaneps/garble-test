# syntax=docker/dockerfile:experimental
FROM golang:1.16.3 AS build

WORKDIR /go/src/app

# download go.mod dependencies
COPY ./go.mod .
COPY ./go.sum .
RUN --mount=type=cache,target=/go/pkg/mod go mod download -x

COPY . .

RUN --mount=type=cache,target=/go/pkg/mod \
    go get mvdan.cc/garble
RUN --mount=type=cache,target=/go/pkg/mod \
    --mount=type=cache,target=/root/.cache/go-build \
    GIT_TERMINAL_PROMPT=1 \
    CGO_ENABLED=0 \
    GOPRIVATE=* \
    garble -tiny -literals -seed=random build -trimpath -ldflags "-s -w" -o ./bin/garble-test .

# copy executable to new container, so GITLAB_TOKEN, GITLAB_USER and source code won't be exposed
# through `docker history` command
FROM alpine:latest

WORKDIR /go/src/app

COPY --from=build /go/src/app/bin ./bin

ENTRYPOINT [ "ping" ]

CMD [ "google.com" ]
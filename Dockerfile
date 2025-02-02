FROM golang:1-buster AS builder

WORKDIR /build
COPY . /build
RUN cd /build/cmd && go build -v

FROM debian:buster-slim

EXPOSE 8080
COPY --from=builder /build/cmd/cmd /pnrsh
ENTRYPOINT /pnrsh


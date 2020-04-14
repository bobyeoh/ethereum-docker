FROM golang:1.14-alpine as builder
LABEL maintainer="Bob Yang<b@001.gs>"
RUN apk add --no-cache make gcc musl-dev linux-headers git
WORKDIR /
RUN git clone https://github.com/ethereum/go-ethereum.git
RUN cd /go-ethereum && make geth
FROM alpine:latest
RUN apk add --no-cache ca-certificates
COPY --from=builder /go-ethereum/build/bin/geth /usr/local/bin/
EXPOSE 8545 8546 8547 30303 30303/udp
ENTRYPOINT ["geth"]
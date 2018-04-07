FROM alpine:3.5

RUN \
  apk add --update go git make gcc musl-dev linux-headers ca-certificates && \
  git clone --depth 1 https://github.com/tim-coin/tim && \
  (cd tim && make timd) && \
  cp tim/build/bin/timd /timd && \
  apk del go git make gcc musl-dev linux-headers && \
  rm -rf /tim && rm -rf /var/cache/apk/*

EXPOSE 8545
EXPOSE 30303

ENTRYPOINT ["/timd"]

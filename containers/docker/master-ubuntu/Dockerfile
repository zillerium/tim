FROM ubuntu:xenial

RUN \
  apt-get update && apt-get upgrade -q -y && \
  apt-get install -y --no-install-recommends golang git make gcc libc-dev ca-certificates && \
  git clone --depth 1 --branch release/1.7 https://github.com/tim-coin/tim && \
  (cd tim && make timd) && \
  cp tim/build/bin/timd /timd && \
  apt-get remove -y golang git make gcc libc-dev && apt autoremove -y && apt-get clean && \
  rm -rf /tim

EXPOSE 8545
EXPOSE 30303

ENTRYPOINT ["/timd"]

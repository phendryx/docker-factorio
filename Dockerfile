FROM ubuntu:14.04

MAINTAINER Paul Hendryx <phendryx@gmail.com>

RUN  apt-get update \
  && apt-get install -y wget \
  && rm -rf /var/lib/apt/lists/*

#RUN  wget -q -O - https://www.factorio.com/download-headless/stable | grep -o -m1 "/get-download/.*/headless/linux64" | awk '{print "--no-check-certificate https://www.factorio.com"$1" -O /tmp/factorio.tar.gz"}' | xargs wget \

RUN  wget -q --no-check-certificate https://www.factorio.com/get-download/0.13.13/headless/linux64 -O /tmp/factorio.tar.gz \
  && tar -xzf /tmp/factorio.tar.gz -C /opt \
  && rm -rf /tmp/factorio.tar.gz

ADD  init.sh /opt/factorio/

WORKDIR /opt/factorio
CMD ["./init.sh"]

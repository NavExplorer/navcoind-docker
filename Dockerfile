FROM ubuntu:xenial

RUN apt-get update --fix-missing
RUN apt-get install -y curl 

RUN cd tmp && curl -Lk https://github.com/navcoin/navcoin-core/releases/download/4.6.0/navcoin-4.6.0-x86_64-linux-gnu.tar.gz | tar xvz

RUN apt-get install -y libcurl3-dev ntpdate ntp 

RUN cp /tmp/navcoin-4.6.0/bin/* /usr/local/bin

COPY config/navcoin.conf /root/.navcoin4/navcoin.conf

RUN mkdir /data

WORKDIR /data

CMD /usr/local/bin/navcoind

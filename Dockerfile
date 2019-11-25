FROM ubuntu:xenial

RUN apt-get update --fix-missing
RUN apt-get install -y curl libcurl3-dev ntpdate ntp libzmq-dev

RUN cd tmp && curl -Lk https://builds.navcore.org/4.7.0/navcoin-4.7.0-x86_64-linux-gnu.tar.gz | tar xvz

RUN cp /tmp/navcoin-4.7.0/bin/* /usr/local/bin

CMD /usr/local/bin/navcoind

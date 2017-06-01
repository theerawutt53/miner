FROM ubuntu:16.04

MAINTAINER Tanguy Pruvot <tanguy.pruvot@gmail.com>

RUN apt-get update -qq

RUN apt-get install -qy build-essential libcurl4-openssl-dev git automake libtool libjansson* libncurses5-dev libssl-dev

RUN git clone --recursive https://github.com/tpruvot/cpuminer-multi -b linux

RUN cd cpuminer-multi && ./autogen.sh  \
    && ./configure --with-crypto --with-curl \
    && make -j"$(nproc)" \
    && make install

CMD ["cpuminer","-a","lyra2re","-o","stratum+tcp://lyra2re.hk.nicehash.com:3342","-u","1H8ud5sMw4ZHxmvc3Lxbv9J9rw7YpBSuba.b1","-p","x"]

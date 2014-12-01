FROM ubuntu
MAINTAINER Matt Koski <maccam912@gmail.com>

# Upgrade the build and include the universe repo.
RUN sed -i.bak 's/main$/main universe/' /etc/apt/sources.list
RUN apt-get update
RUN apt-get upgrade -y

RUN apt-get install build-essential git autoconf -y
RUN git clone https://github.com/elmad/darkcoin-cpuminer-1.3-avx-aes
RUN cd darkcoin* && chmod +x autogen.sh && ./autogen.sh && ./configure CFLAGS="-O3 -march=native"

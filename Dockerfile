#
# Luvit v2.17.0
#

FROM ubuntu:16.04
MAINTAINER nasawz <nasawz@163.com>

#
# Pkg
#

ENV VERSION 2.17.0

#
# System
#

RUN apt-get update -qq
RUN apt-get install -qqy --force-yes build-essential curl
RUN apt-get install libsqlite3-dev -y
#
# Pull Luvit
#

WORKDIR /tmp
RUN curl -L# https://github.com/luvit/luvit/archive/$VERSION.tar.gz | tar xz
RUN cd luvit-$VERSION && make && make install
RUN rm -fr luvit-$VERSION.tar.gz

#
# Entry
#

WORKDIR /
CMD ["luvit"]
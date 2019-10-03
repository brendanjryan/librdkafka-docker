FROM golang:1.12-stretch
LABEL author="ryan.brendanjohn@gmail.com"

ARG LIBRDKAFKA_VERSION

# Download, install, and configure librdkafka
RUN apt-get update && apt-get install -y --no-install-recommends curl ca-certificates build-essential
WORKDIR /tmp/librdkafka
RUN curl -SL https://github.com/edenhill/librdkafka/archive/${LIBRDKAFKA_VERSION}.tar.gz | tar -xz --strip-components 1
RUN ./configure --prefix /usr && make && make install

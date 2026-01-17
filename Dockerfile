FROM debian:13.2

RUN apt-get update && \
    apt-get install -y build-essential && \
    rm -rf /var/lib/apt/lists/*

COPY findmax.deb /tmp/findmax.deb

RUN dpkg -i /tmp/findmax.deb || apt-get install -f -y

WORKDIR /usr/local/bin

CMD ["findmax"]

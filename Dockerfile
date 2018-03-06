FROM debian
MAINTAINER Alexis Pereda <alexis@pereda.fr>

LABEL maintainer="Alexis Pereda <alexis@pereda.fr>"
LABEL version="1.0"
LABEL description="tmake server"

RUN apt update \
	&& apt install --no-install-recommends --no-install-suggests -y \
		automake build-essential cmake libevent-dev libmsgpack-dev libncurses-dev \
		libssh-dev libtool locales pkg-config ruby ruby-msgpack ssh zlib1g-dev \
	&& rm -rf /var/lib/apt/lists/*

COPY ./tmate-slave /tmate-slave
WORKDIR /tmate-slave

RUN ./autogen.sh && ./configure && make

RUN sed -i -re 's/# en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/' /etc/locale.gen && locale-gen

ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8

ENV TMATE_KEYS_DIR  /keys
ENV TMATE_PORT      2222
ENV TMATE_HOSTNAME  ""

COPY ./entrypoint /usr/local/bin/entrypoint

ENTRYPOINT ["/usr/local/bin/entrypoint"]

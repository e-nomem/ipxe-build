FROM debian:buster-20201012-slim
RUN \
	apt update && \
	apt upgrade -y && \
	apt install --no-install-recommends -y software-properties-common build-essential make gcc binutils perl liblzma5 xz-utils liblzma-dev git && \
	apt clean && \
	git clone git://git.ipxe.org/ipxe.git /build/ipxe
WORKDIR /build/ipxe

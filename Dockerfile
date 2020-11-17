FROM debian:buster-20201012-slim
RUN \
	apt update && \
	apt upgrade -y && \
	apt install --no-install-recommends --no-install-suggests -y \
		software-properties-common \
		build-essential \
		make \
		gcc \
		binutils \
		perl \
		liblzma5 \
		liblzma-dev \
		xz-utils \
		git \
		gcc-aarch64-linux-gnu \
		gcc-arm-linux-gnueabi \
	&& \
	apt clean && \
	git clone git://git.ipxe.org/ipxe.git /build/ipxe
WORKDIR /build/ipxe/src

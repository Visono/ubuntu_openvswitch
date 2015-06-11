# Lastest ubuntu:trusty
FROM ubuntu:trusty

MAINTAINER Patrik Hagedorn <p.hagedorn@visono.com>

USER root

WORKDIR /

# OpenVSwitch version
ENV OVS_VERSION="openvswitch-2.3.1"

# Install build dependencies
RUN apt-get install -y --force-yes \
    libssl1.0.0=1.0.1f-1ubuntu2 \
    libssl-dev \
    libc6=2.19-0ubuntu6 \
    libc6-dev \
    build-essential \
    fakeroot \
    debhelper \
    autoconf \
    automake \
    bzip2 \
    openssl \
    graphviz \
    python-all \
    procps \
    python-qt4 \
    python-zopeinterface \
    python-twisted-conch \
    libtool \
    wget \
&& apt-get autoclean -y --force-yes \
&& apt-get autoremove -y --force-yes

# Fetch the latest archive
RUN wget http://openvswitch.org/releases/${OVS_VERSION}.tar.gz \
&& tar xzvf ${OVS_VERSION}.tar.gz \
&& rm ${OVS_VERSION}.tar.gz

# Build without check in parallel
RUN cd ${OVS_VERSION} && DEB_BUILD_OPTIONS='parallel=8 nocheck' fakeroot debian/rules binary \
&& mkdir /${OVS_VERSION}-build

# Adding scripts
COPY run.sh /run.sh
RUN chmod 755 /*.sh

CMD ["/run.sh"]
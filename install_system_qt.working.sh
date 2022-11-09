#!/bin/bash 
#
set -eu

BAT_VERSION=0.22.1

apt-get update -qq

export DEBIAN_FRONTEND="noninteractive"

dpkg_apt() { 
        [ -f $1 ] && { dpkg -i $1 || apt-get -y install -f; } || return 1; 
};

main_pkg() {
        apt-get install -qq -y --no-install-recommends \
                bison \
                build-essential \
                ca-certificates \
                capnproto \
                ccache \
                clang-12 \
                clang-tidy-12 \
                cmake \
                curl \
                flex \
                git \
                wget \
                help2man \
                icoutils \
                libcapnp-dev \
                libdbus-1-3 \
                libfreetype6 \
                libfontconfig1 \
                libgl1-mesa-dev \
                libgl1-mesa-glx \
                libnanopb-dev \
                libprotobuf-dev \
                libgrpc++-dev \
                libxkbcommon-x11-0 \
                nanopb \
                ninja-build \
                nsis \
                pkg-config \
                protobuf-compiler \
                protobuf-compiler-grpc \
                psmisc \
                python3-pip \
                python3-setuptools \
                p7zip-full \
                subversion \
                unzip \
                zip \
                software-properties-common \
                vim && \
                dpkg_apt bat_${BAT_VERSION}_amd64.deb
}


function qt5-default() {
        apt-get install -qq -y --no-install-recommends \
                qt5-default \
                qtbase5-private-dev \
                qtwebengine5-dev \
                qttools5-dev \
                libqt5sql5-mysql \
                libqt5charts5-dev \
                libqt5svg5-dev \
                libqt5scxml5-dev
}


function qt4_rock_core() {

        add-apt-repository --yes ppa:rock-core/qt4

        apt-get install -qq -y --no-install-recommends \
                qt4-default \
                libqt4-dev \
                qt4-dev-tools
}


function qt4_unetbootin() {

        add-apt-repository --yes ppa:gezakovacs/ppa

        apt-get install -qq -y --no-install-recommends \
                qt4-default \
                qt4-dev-tools
}

main_pkg
# qt4_rock_core
# qt5-default

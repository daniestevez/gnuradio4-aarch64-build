# syntax=docker/dockerfile:1

FROM ubuntu:24.04

ARG DEBIAN_FRONTEND="noninteractive"

ADD multistrap.conf .

RUN apt-get update \
    && apt-get -y upgrade \
    && apt-get install -y wget cmake git software-properties-common gnupg \
    multistrap \
    && wget https://apt.llvm.org/llvm.sh \
    && chmod +x llvm.sh \
    && ./llvm.sh 19 \
    && rm -f llvm.sh \
    && mkdir -p /sysroot/etc/apt/trusted.gpg.d/ \
    && cp /etc/apt/trusted.gpg.d/apt.llvm.org.asc /sysroot/etc/apt/trusted.gpg.d/ \
    && multistrap -f multistrap.conf

ADD toolchain.cmake .

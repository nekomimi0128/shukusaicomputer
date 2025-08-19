FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive
ENV LANG=ja_JP.UTF-8
ENV LANGUAGE=ja_JP:ja
ENV LC_ALL=ja_JP.UTF-8

# 日本語環境・XFCE・VNC・noVNC
RUN apt-get update && apt-get install -y \
    xfce4 xfce4-goodies \
    tigervnc-standalone-server tigervnc-common \
    websockify novnc \
    fonts-noto-cjk language-pack-ja \
    x11-xserver-utils \
    && locale-gen ja_JP.UTF-8 \
    && apt-get clean

WORKDIR /

EXPOSE 6080

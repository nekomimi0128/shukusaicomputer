FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive

# 日本語環境とフォント
RUN apt-get update && apt-get install -y \
    sudo \
    language-pack-ja \
    fonts-noto-cjk \
    locales \
    xfce4 xfce4-goodies \
    novnc websockify \
    tigervnc-standalone-server tigervnc-common \
    x11-xserver-utils \
    && locale-gen ja_JP.UTF-8 \
    && update-locale LANG=ja_JP.UTF-8 \
    && apt-get clean

ENV LANG=ja_JP.UTF-8
ENV LANGUAGE=ja_JP:ja
ENV LC_ALL=ja_JP.UTF-8

# ユーザー作成
RUN useradd -m -s /bin/bash SHUKUSAI \
    && echo "SHUKUSAI:shukusai" | chpasswd \
    && adduser SHUKUSAI sudo

# root直下にスクリプト置く
WORKDIR /

EXPOSE 6080

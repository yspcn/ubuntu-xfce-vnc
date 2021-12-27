#!/usr/bin/env bash
### every exit != 0 fails the script
set -e

echo "Install some common tools for further installation"
apt-get update 
apt-get install debconf apt-utils -y
apt-get install -y vim wget net-tools locales bzip2 language-pack-zh-hant language-pack-gnome-zh-hant language-pack-zh-hans language-pack-gnome-zh-hans \
    python-numpy fcitx-bin fcitx-table fcitx-googlepinyin #used for websockify/novnc
apt-get clean -y

echo "generate locales für zh_CN.UTF-8"
locale-gen zh_CN.UTF-8

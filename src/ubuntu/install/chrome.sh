#!/usr/bin/env bash
### every exit != 0 fails the script
set -e

echo "Install Chromium Browser"
apt-get update 
#apt install curl -y
#curl -LO https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
#apt-get install -y ./google-chrome-stable_current_amd64.deb

#apt-get install linuxmint-keyring -y
#sh -c 'echo "deb http://packages.linuxmint.com/ ulyssa upstream" >> /etc/apt/sources.list.d/mint.list' 

#apt-get install software-properties-common -y
#add-apt-repository ppa:chromium-daily/stable -y
#add-apt-repository ppa:chromium-team/beta -y
#apt-key adv --fetch-keys "https://keyserver.ubuntu.com/pks/lookup?op=get&search=0xea6e302dc78cc4b087cfc3570ebea9b02842f111"
#echo 'deb http://ppa.launchpad.net/chromium-team/beta/ubuntu focal main ' >> /etc/apt/sources.list.d/chromium-team-beta.list
#echo 'deb http://ppa.launchpad.net/chromium-team/beta/ubuntu bionic main ' >> /etc/apt/sources.list.d/chromium-team-beta.list
#apt update
#export DEBIAN_FRONTEND=noninteractive
#export DEBCONF_NONINTERACTIVE_SEEN=true
#apt-get install -y chromium-browser chromium-browser-l10n chromium-codecs-ffmpeg
#apt-get -y install python3-selenium

if [[ $ARCH =~ x86_64 ]]; then
  apt-get install software-properties-common -y
  add-apt-repository ppa:alexlarsson/flatpak -y
  apt update
  apt install flatpak -y
  flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
  flatpak install flathub org.chromium.Chromium -y
fi
if [[ $ARCH =~ aarch64 ]]; then
  apt-get install software-properties-common -y
  add-apt-repository ppa:alexlarsson/flatpak -y
  apt update
  apt install flatpak -y
  flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
  flatpak install flathub org.chromium.Chromium -y
fi
#if [[ $ARCH =~ arm ]]; then
  #apt install snapd -y
  #cd /usr/lib/snapd && ./snapd
  #snap install chromium -y
  #apt install -y chromium-browser chromium-browser-l10n chromium-codecs-ffmpeg
#fi


#apt-get install -y chromium-browser chromium-browser-l10n chromium-codecs-ffmpeg
apt-get clean -y
#ln -s /usr/bin/chromium-browser /usr/bin/google-chrome
### fix to start chromium in a Docker container, see https://github.com/ConSol/docker-headless-vnc-container/issues/2
echo "CHROMIUM_FLAGS='--no-sandbox --start-maximized --user-data-dir'" > $HOME/.chromium-browser.init

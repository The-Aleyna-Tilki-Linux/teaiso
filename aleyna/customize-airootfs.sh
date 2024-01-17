#!/usr/bin/env bash
cd /tmp

### Instally 17g and other stuff
yes | apt install wget -yq
wget https://github.com/aleyna-tilki/base-files/releases/download/current/base-files_9999-noupdate_amd64.deb
wget https://github.com/aleyna-tilki/17g-installer/releases/download/current/17g-installer_1.0_all.deb
wget https://github.com/pardus-nosystemd/desktop-base/releases/download/current/desktop-base_9999-noupdate_all.deb
wget https://github.com/aleyna-tilki/aleyna-theme/releases/download/current/aleyna-theme.deb
wget https://github.com/aleyna-tilki/pipewire-launcher/releases/download/current/pipewire-launcher_1.0.0_all.deb
yes | apt install ./*.deb -yq --allow-downgrades

#### fix eudev sed bug about usrmerge shit
# install busybox into /bin as symlink
yes | apt install kmod busybox-static -yq 
$(which busybox) --install -s /bin
ln -s /usr/bin/kmod /sbin/modprobe

#### Disable recommends by default
cat > /etc/apt/apt.conf.d/01norecommend << EOF
APT::Install-Recommends "0";
APT::Install-Suggests "0";
EOF

echo 'Installing i3-gaps...'

# Repository lists
arc_repo=/etc/apt/sources.list.d/arc-theme.list
inf_repo=/etc/apt/sources.list.d/infinality.list

# Install deps
sudo apt-get --allow-unauthenticated -y install fontconfig-infinality arc-theme rofi \
  i3 i3blocks compton lxappearance arandr feh pulseaudio-utils xcape pavucontrol checkinstall

# Installs playerctl to make use of media keys
wget https://github.com/acrisci/playerctl/releases/download/v0.5.0/playerctl-0.5.0_amd64.deb
sudo dpkg -i playerctl-0.5.0_amd64.deb

# Install pulseaudio control
wget https://github.com/graysky2/pulseaudio-ctl/archive/v1.63.tar.gz
tar xzf v1*
cd pulseaudio-ctl*
make && sudo checkinstall

# Setup Repos
echo 'deb http://download.opensuse.org/repositories/home:/Horst3180/Debian_8.0/ /' | sudo tee $arc_repo
echo "deb http://ppa.launchpad.net/no1wantdthisname/ppa/ubuntu trusty main" | sudo tee $inf_repo
echo "deb-src http://ppa.launchpad.net/no1wantdthisname/ppa/ubuntu trusty main" | sudo tee -a $inf_repo
sudo apt-get update

sudo rm $arc_repo $inf_repo
sudo apt-get update

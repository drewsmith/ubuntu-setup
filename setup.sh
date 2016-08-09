#!/bin/bash

# add repos
sudo apt-add-repository -y "deb http://repository.spotify.com stable non-free"
sudo add-apt-repository -y "deb http://archive.canonical.com/ $(lsb_release -sc) partner"
sudo add-apt-repository -y "deb http://dl.google.com/linux/chrome/deb/ stable main"
sudo add-apt-repository -y "deb http://dl.google.com/linux/talkplugin/deb/ stable main"
sudo add-apt-repository -y ppa:webupd8team/java
sudo add-apt-repository -y ppa:webupd8team/sublime-text-3
sudo add-apt-repository -y ppa:mmk2410/intellij-idea-community
sudo add-apt-repository -y ppa:numix/ppa

# mysql
wget https://dev.mysql.com/get/mysql-apt-config_0.7.3-1_all.deb
sudo dpkg -i mysql-apt-config_0.7.3-1_all.deb

# hipchat
sudo sh -c 'echo "deb https://atlassian.artifactoryonline.com/atlassian/hipchat-apt-client $(lsb_release -c -s) main" > /etc/apt/sources.list.d/atlassian-hipchat4.list'
wget -O - https://atlassian.artifactoryonline.com/atlassian/api/gpg/key/public | sudo apt-key add -

# basic update
sudo apt-get -y --force-yes update
sudo apt-get -y --force-yes upgrade

# install apps
sudo apt-get -y --allow-unauthenticated install \
    libxss1 spotify-client sublime-text-installer git gitk gitg \
    virtualbox virtualbox-guest-additions-iso filezilla \
    gimp p7zip p7zip-full p7zip-rar unity-tweak-tool \
    indicator-multiload curl gparted dkms google-chrome-stable \
    ubuntu-wallpapers* gnome-terminal google-talkplugin \
    linux-headers-generic build-essential oracle-java8-installer \
    oracle-java7-installer maven hipchat4 vagrant intellij-idea-community \
    numix-gtk-theme numix-icon-theme-circle ttf-mscorefonts-installer \
    mysql-workbench-community

cd ~/Downloads

wget https://dev.mysql.com/get/Downloads/MySQLGUITools/mysql-workbench-community-6.3.7-1ubu1604-amd64.deb
sudo dpkg -i mysql-workbench-gpl-5.2.47-1ubu1204-amd64.deb 

echo "Installing Slack"
wget https://downloads.slack-edge.com/linux_releases/slack-desktop-2.1.0-amd64.deb
sudo dpkg -i slack-desktop-2.1.0-amd64.deb

echo "Installing ChefDK"
wget https://packages.chef.io/stable/ubuntu/12.04/chefdk_0.16.28-1_amd64.deb
sudo dpkg -i chefdk_0.16.28-1_amd64.deb

echo "Installing AWS CLI"
wget https://s3.amazonaws.com/aws-cli/awscli-bundle.zip
unzip awscli-bundle.zip
./awscli-bundle/install

# attempt to install anything that failed
# sudo apt-get -f -y install

# random directories
mkdir ~/.fonts
mkdir ~/.themes
mkdir ~/.icons
mkdir ~/code

rm -rf ~/Documents
rm -rf ~/Public
rm -rf ~/Templates
rm -rf ~/Videos
rm -rf ~/Music

echo "Done."

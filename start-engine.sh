#!/bin/bash
#check if user is logged in as root
script_runner=$(whoami)

if [ $script_runner == "root" ] ; then
  echo -e "\nFor security reasons this script must be run as a normal user with sudo privileges\n"
  exit 1
fi

clear
echo'[Welcome to Locomotive Script]'

#Start install prerequisite
echo '[###### Update server ######]'
sleep 1
sudo apt-get -y update
sudo apt-get -y upgrade
echo '[###### Done ######]'
sleep 1

#Start downloading and running RailsReady script
sleep 1
echo '[###### Installing RailsReady ######]'
wget --no-check-certificate https://raw.github.com/johnrlive/railsready/master/railsready.sh && bash railsready.sh
echo "[###### Done ######]"
sleep 1

echo '[###### Install utility tool ######]'
sleep 1
sudo apt-get install -y vim
sudo apt-get install -y mc
sudo apt-get install -y tmux
sudo apt-get install -y zsh
sudo apt-get install -y wget
sudo apt-get install -y curl
echo "[###### Done ######]"
sleep 1

echo '[##### install Oh-my-zsh ######]'
sleep 1
cd ~
git clone git://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
wget --no-check-certificate https://github.com/johnrlive/dotfiles/blob/master/install/zshrc.zsh-template
cp ~/zshrc.zsh-template ~/.zshrc.omz
source ~/.zshrc
echo '[###### oh-my-zsh installed ######]'
sleep 1

echo '[###### Change Shell to ZSH ######]'
sleep 1
source ~/.bash_profile
chsh -s `which zsh`
source ~/.zshrc
echo "[###### Done ######]"
sleep 1

echo '[###### Installed #######]'
sleep 1
which $SHELL
rvm -v
ruby -v
rails -v
gem -v
echo "[###### Done ######]"
sleep 1

echo '[###### install dotfiles #####]'
sleep 1
cd ~
git clone git://github.com/johnrlive/dotfiles.git
cd dotfiles
./install.sh
echo '[###### cloned vim dotfiles ######]'
sleep 1

echo "\n Choo-Choo\n"

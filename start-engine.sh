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
echo "[###### Done ######]"
sleep 1

echo '[###### install vim-config #####]'
sleep 1
cd ~
git clone git://github.com/johnrlive/vim-config.git
cd vim-config
rake
echo '[###### cloned vim config ######]'

echo "\n Choo-Choo\n"



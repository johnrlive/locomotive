# Ask what operating system?
  echo -e "\n"
  echo "What OS are you installing locomotive script on?"
  echo "=> 1. Ubuntu"
  echo "=> 2. OSX"
  echo -n "Select your OS type [1 or 2]? "
  read whichOS

  if [ $whichOS -eq 1 ] ; then
      echo -e "\n\n!!! Ubuntu !!! \n"
      wget --no-check-certificate https://raw.github.com/johnrlive/railsready/master/railsready.sh && bash railsready.sh
  elif [ $whichOS -eq 2 ] ; then
      echo -e "\n\n!!! OSX !!! \n"
      curl -O https://raw.github.com/johnrlive/railsready/master/railsready.sh && bash railsready.sh
  else
      echo -e "\n\n!!! Must choose to Ubuntu or OSX, exiting !!!"
      exit 1
  fi

  echo "==> done..."

  echo "\n Choo-Choo\n"

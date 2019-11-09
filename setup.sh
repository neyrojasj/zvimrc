#!/bin/bash

# Obtain the first argument
DST_FOLDER="$1"

# Verify the current OS
if [ "$(uname)" == "Darwin" ]; then
  MACHINE=MAC
elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
  MACHINE=LINUX
else
  echo "The current MACHINE is not supported ${uname}"
  exit 1
fi

if [ ! -x "$(command -v curl)" ]; then
  sudo -E apt-get install curl -y
  if [ ! -x "$(command -v curl)" ]; then
    echo "Unable to install Curl "
    exit 1
  fi
fi

if [ ! -f "${DST_FOLDER}/.vim/autoload/plug.vim" ]; then
  echo "Installing autoload vim plugin"
  echo "=============================="
  curl -fLo ${DST_FOLDER}/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  if [ ! -f "${DST_FOLDER}/.vim/autoload/plug.vim" ]; then
    echo "Unable to download the autoload plugins from vim"
    exit 1
  fi
fi

if [ ! -x "$(command -v yarn)" ]; then
  echo "Installing Yarn"
  echo "==============="
  if [ "${MACHINE}" == "MAC" ]; then
    sudo brew install yarn 2> /dev/null
    if [ ! -x "$(command -v yarn)" ]; then
      echo "Unable to install yarn using brew"
      exit 1
    fi
  else
    curl -sL https://deb.nodesource.com/setup_10.x | sudo -E bash -
    curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
    echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list
    sudo apt-get update
    sudo apt-get install nodejs yarn xclip -y 2> /dev/null
    for PKT in node yarn xclip
    do
      if [ ! -x "$(command -v ${PKT})" ]; then
        echo "The following packet is not installed ${PKT}"
        exit 1
      fi
    done
  fi
fi
echo "Installing external plugins"
yarn global add prettier 2> /dev/null
if [ $? -eq 0 ]; then
  echo "Unable to add prettier to the global plugins using yarn"
  exit 1
fi
touch .setup
# Return success
exit 0

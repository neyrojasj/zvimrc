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

if [ ! -f "${DST_FOLDER}/.vim/autoload/plug.vim" ]; then
  echo "Installing autoload vim plugin"
  echo "=============================="
  curl -fLo ${DST_FOLDER}/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
fi

if [ ! -x "$(command -v yarn)" ]; then
  echo "Installing Yarn"
  echo "==============="
  if [ "${MACHINE}" == "MAC" ]; then
    brew install yarn
  else
    apt-get install yarn -y
  fi
fi
echo "Installing external plugins"
yarn global add prettier

# Return success
exit 0

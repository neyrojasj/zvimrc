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

# Create symlinks for plugin configurations
echo "Setting up plugin configurations"
echo "================================="
mkdir -p ${DST_FOLDER}/.vim/zplugins

# Get the directory where this script is located (zvimrc repository)
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Create symlinks for all zplugin configurations
if [ -d "${SCRIPT_DIR}/zplugins" ]; then
  for plugin_dir in ${SCRIPT_DIR}/zplugins/*/; do
    if [ -d "$plugin_dir" ]; then
      plugin_name=$(basename "$plugin_dir")
      # Remove existing symlink or directory if it exists
      rm -rf "${DST_FOLDER}/.vim/zplugins/${plugin_name}"
      # Create new symlink
      ln -sf "${plugin_dir}" "${DST_FOLDER}/.vim/zplugins/${plugin_name}"
      echo "Linked ${plugin_name} configuration"
    fi
  done
  echo "Plugin configurations linked successfully"
else
  echo "Warning: zplugins directory not found in ${SCRIPT_DIR}"
fi

if [ ! -x "$(command -v yarn)" ]; then
  echo "Installing Yarn"
  echo "==============="
  if [ "${MACHINE}" == "MAC" ]; then
    brew install yarn 2> /dev/null
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

if [ ! -x "$(command -v prettier)" ]; then
  echo "Installing external plugins"
  yarn add prettier 2> /dev/null
  if [ $? -eq 0 ]; then
    echo "Unable to add prettier to the global plugins using yarn"
    exit 1
  fi
fi

if [ ! -f "${DST_FOLDER}/.vim_repos/languagetool" ]; then
  echo "Installing Language tool"
  echo "========================"
  mkdir -p ${DST_FOLDER}/.vim_repos
  curl -fLo ${DST_FOLDER}/.vim_repos/languagetool/download.zip --create-dirs https://www.languagetool.org/download/LanguageTool-stable.zip
  if [ ! -f "${DST_FOLDER}/.vim_repos/languagetool/download.zip" ]; then
    echo "Unable to download language tool"
    exit 1
  fi
fi

touch .setup
# Return success
exit 0

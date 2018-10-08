#!/bin/bash

set -e

sudo apt update
sudo apt install zsh git vim -y

if [ -e ~/.oh-my-zsh ] ;  then
  [ -e ~/.oh-my-zsh/tools/upgrade.sh ] && sh ~/.oh-my-zsh/tools/upgrade.sh
else
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
fi

chsh -s $(which zsh)

# autojump
sudo apt install autojump -y

# plugins

# zsh-syntax-highlighting
if [ ! -e ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions ] ; then
  git clone git://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions
  sed -i '/^  git/a \ \ zsh-autosuggestions' ~/.zshrc
fi

# zsh-syntax-highlighting
if [ ! -e ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting ] ; then
  git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting
  sed -i '/^  git/a \ \ zsh-syntax-highlighting' ~/.zshrc
fi

if [ $SHELL == $(which zsh) ] ; then
  source ~/.zshrc
fi

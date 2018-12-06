#!/bin/bash

set -e

sudo apt update
sudo apt install zsh git vim -y

if [ -e ~/.oh-my-zsh ] ;  then
  [ -e ~/.oh-my-zsh/tools/upgrade.sh ] && sh ~/.oh-my-zsh/tools/upgrade.sh
else
  # sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
  if [ ! -n "$ZSH" ]; then
    ZSH=~/.oh-my-zsh
  fi
  umask g-w,o-w
  git clone --depth=1 https://github.com/robbyrussell/oh-my-zsh.git "$ZSH"
  if [ -f ~/.zshrc ] || [ -h ~/.zshrc ]; then
    mv ~/.zshrc ~/.zshrc.pre-oh-my-zsh;
  fi
  cp "$ZSH"/templates/zshrc.zsh-template ~/.zshrc
  sed "/^export ZSH=/ c\\
  export ZSH=\"$ZSH\"
  " ~/.zshrc > ~/.zshrc-omztemp
  mv -f ~/.zshrc-omztemp ~/.zshrc
fi


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

TEST_CURRENT_SHELL=$(expr "$SHELL" : '.*/\(.*\)')
if [ "$TEST_CURRENT_SHELL" != "zsh" ]; then
  if hash chsh >/dev/null 2>&1; then
    echo "Please run bellow command to change your default sh"
    echo "chsh -s $(grep /zsh$ /etc/shells | tail -1)"
  else
    printf "I can't change your shell automatically because this system does not have chsh.\n"
  fi
fi

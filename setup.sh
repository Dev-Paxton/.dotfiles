#!/usr/bin/env bash
read -p "Tmux prefix [C-Space]: " tmux_prefix

sudo apt install zsh curl git stow tmux -y

chsh -s $(which zsh)

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
rm ~/.zshrc

curl -sS https://raw.githubusercontent.com/ajeetdsouza/zoxide/main/install.sh | bash

git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install --key-bindings --completion --no-bash --no-zsh

cd .dotfiles

if [ -n "$tmux_prefix" ]; then
    echo "unbind C-Space" >> .tmux.conf
    echo "set -g prefix $tmux_prefix" >> .tmux.conf
    echo "bind-key $tmux_prefix send-prefix" >> .tmux.conf
fi

stow .

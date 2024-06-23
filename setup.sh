#!/bin/bash

# 更新系统
sudo apt update && sudo apt upgrade -y

# 安装常用工具
sudo apt install -y curl wget tree indent build-essential vim git

# 安装 vimplus
git clone https://github.com/chxuan/vimplus.git ~/vimplus-master
cd ~/vimplus-master
./install.sh
rm -rf ~/.vim/plugged/YouCompleteMe
sudo apt install -y vim-youcompleteme
vim-addons install youcompleteme

# 安装其他常用工具
sudo apt install -y htop tmux zsh

# 安装 Oh My Zsh (可选)
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

echo "Server setup complete!"

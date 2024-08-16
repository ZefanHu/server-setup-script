#!/bin/bash

# 记录开始时间
start_time=$(date +%s)

# 设置非交互模式，避免弹窗
export DEBIAN_FRONTEND=noninteractive

# 更新系统
sudo apt update && sudo apt upgrade -y

# 安装常用工具
sudo apt install -y curl wget tree indent net-tools build-essential vim git gdb

# 安装 vimplus
git clone https://github.com/chxuan/vimplus.git ~/vimplus-master
cd ~/vimplus-master

# 修改 install.sh 以自动选择 Python 3
sed -i 's/read -p "Please choose python version (2/3): " python_version/python_version=3/' install.sh

# 运行安装脚本，使用 yes 命令自动回答所有提示
yes | ./install.sh

# 删除 YouCompleteMe 并重新安装
rm -rf ~/.vim/plugged/YouCompleteMe
sudo apt install -y vim-youcompleteme
vim-addons install youcompleteme

# 优化 bash 提示符
echo 'export PS1='"'"'\[\e[36;48m\]\u\[\e[33;48m\]@\[\e[36;48m\]:\[\e[31;48m\]\W\[\e[00m\]\$'"'" >> ~/.bashrc

# 记录结束时间
end_time=$(date +%s)

# 计算执行时间
execution_time=$((end_time - start_time))

# 转换秒数为更易读的格式
hours=$((execution_time / 3600))
minutes=$(( (execution_time % 3600) / 60 ))
seconds=$((execution_time % 60))

echo "Server setup complete!"
echo "Total execution time: $hours hours, $minutes minutes, $seconds seconds"

# 询问是否安装并执行 tcp.sh
read -p "Do you want to download and run tcp.sh for BBR acceleration? (y/n) " -n 1 -r
echo    # 移动到新行
if [[ $REPLY =~ ^[Yy]$ ]]
then
    # 下载 tcp.sh
    wget -N --no-check-certificate "https://raw.githubusercontent.com/ylx2016/Linux-NetSpeed/master/tcp.sh"

    # 给予执行权限
    chmod +x tcp.sh

    # 执行脚本
    ./tcp.sh
fi

echo "All tasks completed!"


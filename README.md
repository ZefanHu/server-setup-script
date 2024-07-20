# Ubuntu 服务器自动配置脚本

这个脚本用于自动化配置 Ubuntu 服务器，包括系统更新、安装常用工具、配置 Vim 环境等。

## 注意事项

⚠️ 此脚本仅在 Ubuntu 22.04 LTS 上测试过。在其他版本或发行版上使用可能会导致意外结果。

## 功能

- 更新系统
- 安装常用工具（curl, wget, tree, indent, build-essential, vim, git, gdb）
- 安装并配置 vimplus（完成之后, 会删除 YouCompleteMe 并重新安装, 避免一些奇怪的错误）
- 优化 Bash 命令行提示符

## 使用方法

1. 下载脚本：

   ```
   wget https://raw.githubusercontent.com/yourusername/yourrepository/main/setup_script.sh
   ```

2. 给脚本添加执行权限：

   ```
   chmod +x setup_script.sh
   ```

3. 运行脚本：

   ```
   ./setup_script.sh
   ```

## 警告

- 此脚本会自动回答所有安装过程中的提示，请确保您了解所有将要安装的软件包和它们的默认配置。
- 脚本会修改您的 .bashrc 文件，如果您有自定义的 Bash 配置，请在运行脚本前进行备份。

## 贡献

如果您发现任何问题或有改进建议，欢迎提交 issue 或 pull request。

## 许可

[MIT License](LICENSE)  

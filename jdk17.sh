#!/bin/bash

# 检查是否以 root 用户运行
if [ "$EUID" -ne 0 ]; then
   echo "请以 root 用户运行此脚本。"
   exit 1
fi

# 检查 /opt/local/ 文件夹是否存在，不存在则创建
if [! -d "/opt/local/" ]; then
    mkdir -p /opt/local/
    echo "创建 /opt/local/ 文件夹成功。"
fi

# 下载 JDK 到 /opt/local/
wget -P /opt/local/ https://download.oracle.com/java/17/latest/jdk-17_linux-x64_bin.tar.gz

# 解压 JDK
tar -xf /opt/local/jdk-17_linux-x64_bin.tar.gz -C /opt/local/

# 重命名解压后的文件夹为 jdk
mv /opt/local/jdk-17.0.8 /opt/local/jdk

# 设置环境变量
echo "export JAVA_HOME=/opt/local/jdk" >> /etc/profile
echo "export PATH=\$JAVA_HOME/bin:\$PATH" >> /etc/profile

# 使环境变量生效
source /etc/profile

echo "JDK 安装完成。"

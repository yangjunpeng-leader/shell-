#!/bin/bash

# 检查是否以 root 用户运行
if [ "$EUID" -ne 0 ]; then
   echo "请以 root 用户运行此脚本。"
   exit 1
fi

# 下载 JDK
wget -P /opt/ https://download.oracle.com/java/17/latest/jdk-17_linux-x64_bin.tar.gz

# 解压 JDK
tar -xf /opt/jdk-17_linux-x64_bin.tar.gz -C /opt/

# 设置环境变量
echo "export JAVA_HOME=/opt/jdk-17.0.8" >> /etc/profile
echo "export PATH=\$JAVA_HOME/bin:\$PATH" >> /etc/profile

# 使环境变量生效
source /etc/profile

echo "JDK 安装完成。"
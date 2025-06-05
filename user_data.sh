#!/bin/bash

# 必要パッケージのインストール
apt update -y
apt install -y git docker.io -y

# Docker起動
systemctl start docker
systemctl enable docker

# アプリのクローン
cd /home/ubuntu
git clone https://github.com/Rikishi-com/HandsOn_Docker
cd HandsOn_Docker

# Dockerビルド & コンテナ起動
sudo docker build -t apache-app .
sudo docker run -d -p 80:80 --name apache apache-app
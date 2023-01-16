#!/bin/bash

# Parando e desabilitando o firewall do SO
systemctl stop firewalld && systemctl disable firewalld

# Desabilitando o selinux
sed -i s/^SELINUX=.*$/SELINUX=disabled/ /etc/selinux/config

# Habilitando o repositório Epel
dnf config-manager --set-enabled crb
dnf install epel-release -y
/usr/bin/crb enable

# Atualizando o SO
dnf update -y

# Adicionando o repositório do Docker
dnf config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo

# Instalando o Docker/Docker Compose
dnf install docker-ce docker-ce-cli containerd.io docker-compose-plugin -y
systemctl start docker && systemctl enable docker

# Adicionando o usuário Vagrant ao grupo Docker
usermod -aG docker vagrant

# reiniciando o SO
shutdown -r now
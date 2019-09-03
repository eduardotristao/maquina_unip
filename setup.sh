#!/bin/bash

echo "---- Iniciando instalacao do ambiente de Desenvolvimento PHP ---"

echo "--- Instalando Visual Code ---"
sudo apt update
sudo apt install -y apt-transport-https wget
wget -q https://packages.microsoft.com/keys/microsoft.asc -O- | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main"
sudo apt update
sudo apt install code -y

echo "[OK] --- Ambiente de desenvolvimento concluido ---"


#Instalação do Postgre11

# Primeiro checa se o sistema possui o PostgreSQL instalado.
  if sudo su -c 'command -v postgres' > /dev/null 2>&1; then
    echo "PostgreSQL já instalado. [$CHECK_SYMBOL]"
  else
    echo "PostgreSQL não encontrado. [$ERROR_SYMBOL]"
    echo 'Instalando PostgreSQL...'
    echo ''
    sudo apt-get install -y vim wget ca-certificates
    wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo apt-key add -
    RELEASE=$(lsb_release -cs)
    echo "deb http://apt.postgresql.org/pub/repos/apt/ ${RELEASE}"-pgdg main | sudo tee  /etc/apt/sources.list.d/pgdg.list
    sudo apt update
    sudo apt -y install postgresql-11
    echo ''
    echo "PostgreSQL instalado com sucesso. [$CHECK_SYMBOL]"
  fi

#Instalação do PHP 7.1

# Primeiro checa se o sistema possui o PHP instalado.
  if sudo su -c 'command -v php' > /dev/null 2>&1; then
    echo "PHP já instalado. [$CHECK_SYMBOL]"
  else
    echo "PHP não encontrado. [$ERROR_SYMBOL]"
    echo 'Instalando PHP...'
    echo ''
    sudo apt install -y software-properties-common
    add-apt-repository ppa:ondrej/php
    sudo apt install -y php7.1 php7.1-common php7.1-opcache php7.1-mcrypt php7.1-cli php7.1-gd php7.1-curl php7.1 php7.1-fpm
    php -v
    echo ''
    echo "PostgreSQL instalado com sucesso. [$CHECK_SYMBOL]"
  fi

echo "--- Baixando e Instalando Composer ---"
curl -sS https://getcomposer.org/installer | php
sudo mv composer.phar /usr/local/bin/composer

# Instalando Nginx
    apt-get update
    apt-get install nginx
    systemctl restart nginx.service
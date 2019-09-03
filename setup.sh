#!/bin/bash

echo "---- Iniciando instalacao do ambiente de Desenvolvimento PHP ---"

echo "--- Atualizando lista de pacotes ---"
sudo apt-get update

echo "--- Instalando pacotes basicos ---"
sudo apt-get install software-properties-common vim curl python-software-properties git-core --assume-yes --force-yes

echo "--- Adicionando repositorio do pacote PHP ---"
sudo add-apt-repository ppa:ondrej/php

echo "--- Atualizando lista de pacotes ---"
sudo apt-get update

echo "--- Instalando MySQL, Phpmyadmin e alguns outros modulos ---"
sudo apt-get install mysql-server-5.5 mysql-client phpmyadmin --assume-yes --force-yes

echo "--- Instalando PHP, Apache e alguns modulos ---"
sudo apt-get install php7.1 php7.1-common --assume-yes --force-yes
sudo apt-get install php7.1-cli libapache2-mod-php7.1 php7.1-mysql php7.1-curl php-memcached php7.1-dev php7.1-mcrypt php7.1-sqlite3 php7.1-mbstring php*-mysql  php-gd php-xml php-mbstring  zip unzip --assume-yes --force-yes

echo "--- Habilitando o PHP 7.1 ---"
sudo a2dismod php5
sudo a2enmod php7.1

echo "--- Habilitando mod-rewrite do Apache ---"
sudo a2enmod rewrite

echo "--- Reiniciando Apache ---"
sudo service apache2 restart

echo "--- Baixando e Instalando Composer ---"
curl -sS https://getcomposer.org/installer | php
sudo mv composer.phar /usr/local/bin/composer

echo "--- Instalando Banco NoSQL -> Redis <- ---" 
sudo apt-get install redis-server --assume-yes
sudo apt-get install php7.1-redis --assume-yes

echo "--- Instalando Visual Code ---"
sudo apt update
sudo apt install apt-transport-https wget
wget -q https://packages.microsoft.com/keys/microsoft.asc -O- | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main"
sudo apt update
sudo apt install code --assume-yes --force-yes

echo "[OK] --- Ambiente de desenvolvimento concluido ---"


#Instalação do Postgre11

# Primeiro checa se o sistema possui o PostgreSQL instalado.
  if sudo su -c 'command -v postgres' > /dev/null 2>&1; then
    echo "PostgreSQL já instalado. [$CHECK_SYMBOL]"
  else
    echo "PostgreSQL não encontrado. [$ERROR_SYMBOL]"
    echo 'Instalando PostgreSQL...'
    echo ''
    apt-get install wget ca-certificates
    sh -c 'echo "deb http://apt.postgresql.org/pub/repos/apt/ `lsb_release -cs`-pgdg main" >> /etc/apt/sources.list.d/pgdg.list'
    wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | apt-key add -
    apt-get update
    apt-get install -y postgresql-11.2 -f;
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
    apt install software-properties-common
    add-apt-repository ppa:ondrej/php
    apt install php7.1 php7.1-common php7.1-opcache php7.1-mcrypt php7.1-cli php7.1-gd php7.1-curl
    php -v
    echo ''
    echo "PostgreSQL instalado com sucesso. [$CHECK_SYMBOL]"
  fi
# Instalando Nginx
    apt-get update
    apt-get install nginx
    /etc/init.d/nginx start
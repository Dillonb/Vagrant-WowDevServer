#!/usr/bin/env bash


mysql_pass=pizza420
export DEBIAN_FRONTEND=noninteractive

debconf-set-selections <<< 'mysql-server-5.5 mysql-server/root_password password '$mysql_pass''
debconf-set-selections <<< 'mysql-server-5.5 mysql-server/root_password_again password '$mysql_pass''

apt-get install -y mysql-server-5.5 build-essential autoconf libtool gcc g++ make cmake git-core patch wget links zip unzip openssl libssl-dev mysql-server mysql-client libmysqlclient15-dev libmysql++-dev libreadline6-dev zlib1g-dev libbz2-dev screen libncurses5-dev libboost-all-dev

pushd /home/vagrant

sudo -u vagrant git clone https://github.com/Dillonb/TrinityCore

pushd TrinityCore

sudo -u vagrant mkdir build
pushd build

sudo -u vagrant cmake ../ -DPREFIX=/home/vagrant/server -DTOOLS=1
sudo -u vagrant make install

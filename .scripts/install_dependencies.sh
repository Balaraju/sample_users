#!/usr/bin/env bash

debconf-set-selections <<< 'mysql-server mysql-server/root_password password p@ssw0rd'
debconf-set-selections <<< 'mysql-server mysql-server/root_password_again password p@ssw0rd'
apt-get update
apt-get install -y mysql-server

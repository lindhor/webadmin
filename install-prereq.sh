#!/bin/bash

yum install -y epel-release
yum install -y \
  gcc \
  python-devel \
  python-pip \
  libxslt-devel \
  libxml2-devel \
  libffi-devel \
  openssl-devel \
  libjpeg-turbo-devel \
  libpng-devel \
  dbus-python \
  python-augeas \
  ntpdate \
  nodejs

pip install --upgrade  \
  pip \
  docker-py

npm -g install \
  bower \
  babel-cli \
  babel-preset-es2015 \
  babel-plugin-external-helpers \
  less \
  coffee-script \
  angular-gettext-cli \
  angular-gettext-tools


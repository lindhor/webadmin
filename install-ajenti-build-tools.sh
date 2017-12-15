#!/bin/bash

curl -sL https://rpm.nodesource.com/setup_7.x | bash -
yum install nodejs

npm -g install \
  bower \
  babel-cli \
  babel-preset-es2015 \
  babel-plugin-external-helpers \
  less \
  coffee-script \
  angular-gettext-cli \
  angular-gettext-tools

sudo pip install \
  ajenti-dev-multitool

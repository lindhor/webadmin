#!/bin/bash

adduser user
adduser admin
echo "user:vadsomhelst" | chpasswd
echo "admin:vadsomhelst" | chpasswd

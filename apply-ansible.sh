#!/bin/bash

if [ $# -eq 0 ]; then
  TAGS=""
else
  TAGS="--tags=$1"
fi
ansible-playbook -b -i .vagrant/provisioners/ansible/inventory/vagrant_ansible_inventory ansible/site.yml ${TAGS}

#!/bin/bash
ansible-playbook -b -u vagrant --private-key=.vagrant/machines/master/virtualbox/private_key -i .vagrant/provisioners/ansible/inventory/vagrant_ansible_inventory ansible/site.yml

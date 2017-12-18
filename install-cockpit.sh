#!/bin/bash
ansible-playbook -b -i .vagrant/provisioners/ansible/inventory/vagrant_ansible_inventory ansible/cockpit.yml

# README

This is a project used to evaluate different tools for Linux web administration.

- Ajenti
- Webmin
- Cockpit
- AWX

## Prerequisites

To use this project you need the following installed

- Vagrant 2.0.1+ (`https://www.vagrantup.com/downloads.html`)
- Vagrant hosts plugin 2.8.0+ (`vagrant plugin install vagrant-hosts`)
- VirtualBox 5.1.30+ (`https://www.virtualbox.org/wiki/Downloads`)
- Ansible 2.4.2.0+ (`http://docs.ansible.com/ansible/latest/intro_installation.html`)

## Start up test environment

The test environment is made up of two virtual machines, node1 and node2. node1 is a central management node and node2 a managed server.
These are started via the command `vagrant up`.

Tools that are used solely for local management are installed on all nodes.

## Remove test environment

Run `vagrant destroy -f` to remove the two virtual machines.

## Reinstall

- To reinstall all components on existing virtual machines run either `vagrant provision` or `./apply-ansible.sh`.
- To reinstall specific tools, run `./apply-ansible.sh tag`, where *tag* is prereq, ajenti, awx, cockpit, webmin... as defined in `site.yml`
- To update plugins, run `./apply-ansible.sh update`

## Test users

### Administrative user

- user: testadmin
- password: password

### Normal user

- user: testuser
- password: password

## Access services

### Ajenti

- node 1: `http://localhost:8080`
- node 2: `http://localhost:8180`

### AWX

- node 1: `https://localhost:80`

### Cockpit

- node 1: `https://localhost:9090`
- node 2: `https://localhost:9190`

### Webmin

- node 1: `https://localhost:10000`
- node 2: `https://localhost:10100`

Uses internal authentication database by default. Initial login is:

- user: root
- password: password

To allow unix users to login, go to Webmin Users

- Click Create webmin group

  - Create a new webmin group
  - group name *users*
  - add Available webmin modules
  - set Permissions for all modules

- Click Create a new webmin user

  - User name *testuser*
  - Member of group *users*
  - Password Unix authentication

- Go to Configure Unix user authentication

  - Set Allow unix users listed below to login
  - Allow *Members of group* user or group *wheel* as webmin user *root*
  - Allow *Unix user* user or group *testuser* as webmin user *user*

## Develop plugins

### Ajenti development

Plugins are developed in angular.js in combination with Python

- `http://docs.ajenti.org/en/stable/dev/intro.html`

### Cockpit development

Plugins are developed in jquery

- `http://cockpit-project.org/guide/latest/development.html`
- `http://stef.thewalter.net/creating-plugins-for-the-cockpit-user-interface.html`
- `https://github.com/cockpit-project/cockpit/tree/master/pkg/playground`

### Webmin development

Plugins are developed in Perl (CGI)

- `https://doxfer.webmin.com/Webmin/Module_Development`

To show new plugins in the gui you need to grant access to it via *Webmin: Webmin Users: root: Available webmin modules* and refresh the browser.

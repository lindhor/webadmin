# README

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

- `http://docs.ajenti.org/en/stable/dev/intro.html`

### Cockpit development

- `http://stef.thewalter.net/creating-plugins-for-the-cockpit-user-interface.html`

### Webmin development

- `https://doxfer.webmin.com/Webmin/Module_Development`

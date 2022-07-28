andrewrothstein.helmfile
=========

![Build Status](https://github.com/andrewrothstein/ansible-helmfile/actions/workflows/build.yml/badge.svg)

Installs [helmfile](https://github.com/helmfile/helmfile).

Requirements
------------

See [meta/main.yml](meta/main.yml)

Role Variables
--------------

See [defaults/main.yml](defaults/main.yml)

Dependencies
------------

See [meta/main.yml](meta/main.yml)

Example Playbook
----------------

```yml
- hosts: servers
  roles:
    - andrewrothstein.helmfile
```

License
-------

MIT

Author Information
------------------

Andrew Rothstein <andrew.rothstein@gmail.com>

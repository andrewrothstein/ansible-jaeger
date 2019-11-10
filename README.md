andrewrothstein.jaeger
=========
[![Build Status](https://travis-ci.org/andrewrothstein/ansible-jaeger.svg?branch=master)](https://travis-ci.org/andrewrothstein/ansible-jaeger)

Installs [jaeger](https://www.jaegertracing.io/).

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
    - andrewrothstein.jaeger
```

License
-------

MIT

Author Information
------------------

Andrew Rothstein <andrew.rothstein@gmail.com>

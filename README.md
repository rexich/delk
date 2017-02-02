# Chef-managed, Docker-based ELK stack

DELK is a Docker-based ELK stack (Elasticsearch, Logstash, Kibana)
inside a Vagrant box, provisioned by Chef and Kitchen.


# Implementation

- [x] Elasticsearch
- [x] Logstash
- [x] Kibana
- [x] Curator
- [x] Maintenance scripts
- [x] rsyslog forwarder


# Requirements and Usage

Prerequisites that need to be installed and configured properly:

- VirtualBox, with Extension Pack
- Vagrant
- ChefDK
- Kitchen, with Vagrant driver

Initiate test with:
```sh
$ kitchen destroy
$ kitchen create
$ kitchen converge
$ kitchen verify
```

To check if everything's working, open `localhost:5601` in your web
browser. Otherwise, skip this and issue `kitchen test` to do the
complete destroy-create-converge-verify-destroy cycle.


# License

Copyright (c) 2017 Filip Dimovski.

Distributed under the [MIT license](LICENSE).

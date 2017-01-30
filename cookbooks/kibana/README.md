# Dockerized Kibana cookbook

This cookbooks sets up a basic Kibana configuration, ready to be
invoked using a Docker Compose configuration file, or manually by
invoking the `docker` command and setting up volumes and port forwarding
using the command line.


## Requirements

The latest Docker (and preferably Docker Compose) must be installed.


### Platform

Depends on the latest `ubuntu:14.04` Docker image, which will be pulled
if it is not available locally.


### Cookbooks

Depends on `docker` cookbook, version `~>1.12`.
Depends on `elasticsearch` cookbook, version `~>0.0.1`.

## Attributes

- `node["kibana"]["dir"]` - directory where Kibana keeps
  its configuration, data, and logs, default: `~/elasticsearch`
- `node["kibana"]["port"]` - port used for server communication,
  default: `5601`


## Recipes

One recipe provided for invocation: `kibana::default`.


## License and Maintainer

Maintainer: Filip Dimovski <rexich at riseup dot net>

License: MIT

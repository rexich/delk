# Dockerized Elasticsearch cookbook

This cookbooks sets up a basic Elasticsearch configuration, ready to be
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

## Attributes

- `node["elasticsearch"]["dir"]` - directory where Elasticsearch keeps
  its configuration, data, and logs, default: `~/elasticsearch`
- `node["elasticsearch"]["hostname"]` - host name of Elasticsearch
  server, default: `elasticsearch`
- `node["elasticsearch"]["port_api"]` - port used for API communication,
  default: `9200`
- `node["elasticsearch"]["port_clusters"]` - port used for communicating
  with other clusters, default: `9300`
- `node["elasticsearch"]["minimum_master_nodes"]` - minimum number of
  nodes that can be masters on the same cluster, default: `1`


## Recipes

One recipe provided for invocation: `elasticsearch::default`.


## License and Maintainer

Maintainer: Filip Dimovski <rexich at riseup dot net>

License: MIT

# DELK Post-setup Cookbook

This cookbooks sets up the Docker Compose file, that will start the
three microservices (Elasticsearch, Logstash, and Kibana) together, put
them on the same Docker network to allow them to communicate, and be
responsible for controlling their execution (orchestration of tasks).


## Requirements

The latest Docker (and preferably Docker Compose) must be installed.
All of the cookbooks listed in the [cookbooks](#cookbooks) section must
be provisioned and converged. 


### Platform

Platform dependencies are same as the ones of the depending cookbooks.


### Cookbooks

Depends on `docker` cookbook, version `~>0.0.1`.
Depends on `elasticsearch` cookbook, version `~>0.0.1`.
Depends on `logstash` cookbook, version `~>0.0.1`.
Depends on `kibana` cookbook, version `~>0.0.1`.


## Attributes

None.


## Recipes

One recipe provided for invocation: `post-setup::default`.


## License and Maintainer

Maintainer: Filip Dimovski <rexich at riseup dot net>

License: MIT

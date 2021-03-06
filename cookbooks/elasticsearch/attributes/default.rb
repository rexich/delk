# Attributes for Elasticsearch

default["elasticsearch"]["dir"]                   = "/home/#{node["delk_user"]}/elasticsearch"
default["elasticsearch"]["hostname"]              = "elasticsearch"
default["elasticsearch"]["port_api"]              = "9200"
default["elasticsearch"]["port_clusters"]         = "9300"
default["elasticsearch"]["minimum_master_nodes"]  = "1"
default["elasticsearch"]["all_dirs"]              = %w( . conf data logs )

# Basic DELK configuration
default["delk"]["user"]                   = "vagrant"
default["delk"]["dir"]                    = "/home/#{node["delk"]["user"]}/delk"


# Elasticsearch configuration
default["elasticsearch"]["dir"]           = "#{node["delk"]["dir"]}/elasticsearch"
default["elasticsearch"]["hostname"]      = "elasticsearch"
default["elasticsearch"]["port_api"]      = "9200"
default["elasticsearch"]["port_clusters"] = "9300"


# Kibana configuration
default["kibana"]["dir"]                  = "#{node["delk"]["dir"]}/kibana"
default["kibana"]["port"]                 = "5601"


# Logstash configuration
default["logstash"]["dir"]                = "#{node["delk"]["dir"]}/logstash"
default["logstash"]["port"]               = "5000"

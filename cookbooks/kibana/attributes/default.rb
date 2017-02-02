# Attributes for Kibana

default["kibana"]["dir"]      = "/home/#{node["delk_user"]}/kibana"
default["kibana"]["port"]     = "5601"
default["kibana"]["all_dirs"] = %w( . conf )

# Attributes for Logstash

default["logstash"]["dir"]    = "/home/#{node["delk_user"]}/logstash"
default["logstash"]["port"]   = "5000"
default["logstash"]["all_dirs"] = %w( . conf data )

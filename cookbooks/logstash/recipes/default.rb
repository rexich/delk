# Logstash recipe

# Create directories
directory "#{node["logstash"]["dir"]}" do
  owner node["delk_user"]
  group node["delk_user"]
end

directory "#{node["logstash"]["dir"]}/conf" do
  owner node["delk_user"]
  group node["delk_user"]
end

directory "#{node["logstash"]["dir"]}/data" do
  owner node["delk_user"]
  group node["delk_user"]
end


# Create the Dockerfile
file "#{node["logstash"]["dir"]}/Dockerfile" do
  content "FROM logstash:5"
  owner node["delk_user"]
  group node["delk_user"]
end

# Create the configuration file from a template
template "#{node["logstash"]["dir"]}/conf/logstash.conf" do
  source "logstash.conf.erb"
  owner node["delk_user"]
  group node["delk_user"]
  variables({
    logstash_port:      node["logstash"]["port"],
    elasticsearch_host: node["elasticsearch"]["hostname"],
    elasticsearch_port: node["elasticsearch"]["port_api"]
  })
end

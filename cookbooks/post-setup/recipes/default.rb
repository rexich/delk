# Recipe for DELK post-setup

# Create the Docker Compose file
template "/home/#{node["delk_user"]}/docker-compose.yml" do
  source "docker-compose.yml.erb"
  owner node["delk_user"]
  group node["delk_user"]
  variables({
    elasticsearch_port_api:       node["elasticsearch"]["port_api"],
    elasticsearch_port_clusters:  node["elasticsearch"]["port_clusters"],
    docker_network_name:          node["delk_net"],
    logstash_port:                node["logstash"]["port"],
    kibana_port:                  node["kibana"]["port"]
  })
end


# Create a configuration file to emit rsyslog output to port 5000,
# so that Logstash will collect it and forward it to Elasticsearch
service 'rsyslog' do
  action :nothing
end

file "/etc/rsyslog.d/99-emit-logs.conf" do
  content '*.*     @@localhost:5000'
  owner "root"
  group "root"
  mode "0644"
  notifies :restart, "service[rsyslog]", :immediately
end

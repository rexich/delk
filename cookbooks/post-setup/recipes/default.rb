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


# Create, enable, and start DELK Upstart service
execute "reload-upstart-conf" do
  command "sudo initctl reload-configuration"
  action :nothing
end

template "/etc/init/delk.conf" do
  source "delk.conf.erb"
  owner "root"
  group "root"
  mode "0644"
  variables({
    delk_dir: "/home/#{node["delk_user"]}"
  })
  notifies :run, "execute[reload-upstart-conf]", :immediately
end

service "delk" do
  provider Chef::Provider::Service::Upstart
  action [:enable, :start]
end


# Wait a bit for Elasticsearch microservice to start
execute "wait-for-elasticsearch" do
  command "sleep 5"
end

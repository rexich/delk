# Recipe for Kibana

# Create its directory
directory "#{node["kibana"]["dir"]}" do
  owner node["delk_user"]
  group node["delk_user"]
end

directory "#{node["kibana"]["dir"]}/conf" do
  owner node["delk_user"]
  group node["delk_user"]
end


# Generate the Dockerfile from a template
template "#{node["kibana"]["dir"]}/Dockerfile" do
  source "Dockerfile.erb"
  owner node["delk_user"]
  group node["delk_user"]
end


# Generate configuration files from templates
template "#{node["kibana"]["dir"]}/conf/kibana.yml" do
  source "kibana.yml.erb"
  owner node["delk_user"]
  group node["delk_user"]
  variables({
    kibana_port:        node["kibana"]["port"],
    elasticsearch_host: node["elasticsearch"]["hostname"],
    elasticsearch_port: node["elasticsearch"]["port_api"]
  })
end

template "#{node["kibana"]["dir"]}/startup.sh" do
  source "startup.sh.erb"
  owner node["delk_user"]
  group node["delk_user"]
  variables({
    elasticsearch_host: node["elasticsearch"]["hostname"],
    elasticsearch_port: node["elasticsearch"]["port_api"]
  })
end

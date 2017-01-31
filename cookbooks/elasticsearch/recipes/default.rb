# Recipe for Elasticsearch

# Create directories
directory "#{node["elasticsearch"]["dir"]}" do
  owner node["delk_user"]
  group node["delk_user"]
end

directory "#{node["elasticsearch"]["dir"]}/conf" do
  owner node["delk_user"]
  group node["delk_user"]
end

directory "#{node["elasticsearch"]["dir"]}/data" do
  owner node["delk_user"]
  group node["delk_user"]
end

directory "#{node["elasticsearch"]["dir"]}/logs" do
  owner node["delk_user"]
  group node["delk_user"]
end


# Create the Dockerfile
file "#{node["elasticsearch"]["dir"]}/Dockerfile" do
  content "FROM elasticsearch:5"
  owner node["delk_user"]
  group node["delk_user"]

end


# Generate the configuration file from a template
template "#{node["elasticsearch"]["dir"]}/conf/elasticsearch.yml" do
  source "elasticsearch.yml.erb"
  owner node["delk_user"]
  group node["delk_user"]
  variables({
    min_master_nodes: node["elasticsearch"]["minimum_master_nodes"]
  })
end


# Create a configuration file to load kernel settings that will raise
# limit of maximim files that can be mapped, required for Elasticsearch
execute "reload-sysctl" do
  command "sysctl -q --system"
  action :nothing
end

file "/etc/sysctl.d/99-increase-max-map-count.conf" do
  content "vm.max_map_count=262144"
  mode "0644"
  owner "root"
  group "root"
  notifies :run, "execute[reload-sysctl]", :immediately
end

# Recipe for Curator

# Add APT key and repository
apt_repository "curator" do
  uri "http://packages.elastic.co/curator/4/debian"
  distribution "stable"
  components ["main"]
  key "https://packages.elastic.co/GPG-KEY-elasticsearch"
  action :add
end


# Install Curator package
apt_package "elasticsearch-curator"


# Create its directory
directory "#{node["curator"]["dir"]}" do
  owner node["delk_user"]
  group node["delk_user"]
end


# Generate the configuration files from templates
template "#{node["curator"]["dir"]}/actions.yml" do
  source "actions.yml.erb"
  owner node["delk_user"]
  group node["delk_user"]
end

template "#{node["curator"]["dir"]}/config.yml" do
  source "config.yml.erb"
  owner node["delk_user"]
  group node["delk_user"]
  variables({
    elasticsearch_host: node["elasticsearch"]["hostname"],
    elasticsearch_port: node["elasticsearch"]["port_api"]
  })
end


# Generate cron file for periodic, automatic invocation
template "/etc/cron.d/curator-maintenance" do
  source "curator-maintenance.erb"
  mode "0755"
  variables({
    curator_dir:        node["curator"]["dir"],
    elasticsearch_host: node["elasticsearch"]["hostname"],
    elasticsearch_port: node["elasticsearch"]["port_api"]
  })
end


# Enable and restart cron service, just in case
service "cron" do
  action [:enable, :restart]
end

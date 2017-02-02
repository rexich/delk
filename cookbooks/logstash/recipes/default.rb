# Recipe for Logstash

# Create directories
directory "#{node["logstash"]["dir"]}"

node["logstash"]["all_dirs"].each do |dir|
  directory "#{node["logstash"]["dir"]}/#{dir}" do
    owner node["delk_user"]
    group node["delk_user"]
  end
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


# Pull the Docker image
execute "pull-docker-logstash-image" do
  command "sudo docker pull logstash:5"
end

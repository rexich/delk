# Logstash recipe

# Create directories
directory "#{node["logstash"]["dir"]}"
directory "#{node["logstash"]["dir"]}/conf"
directory "#{node["logstash"]["dir"]}/data"

# Create the Dockerfile
file "#{node["logstash"]["dir"]}/Dockerfile" do
  content "FROM logstash:5"
end

# Create the configuration file from a template
template "#{node["logstash"]["dir"]}/conf/logstash.conf" do
  source "logstash.conf.erb"
end
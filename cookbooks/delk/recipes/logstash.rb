# Create directory
directory "#{node["logstash"]["dir"]}"

# Create the Dockerfile
file "#{node["logstash"]["dir"]}/Dockerfile" do
  content "FROM logstash:5"
  mode "0644"
end

# Create the configuration file from a template
template "#{node["logstash"]["dir"]}/elasticsearch.yml" do
  source "logstash.conf.erb"
  mode "0644"
end

# Recipe for Kibana

# Create its directory
directory "#{node["kibana"]["dir"]}"
directory "#{node["kibana"]["dir"]}/conf"


# Generate the Dockerfile from a template
template "#{node["kibana"]["dir"]}/Dockerfile" do
  source "Dockerfile.erb"
end


# Generate configuration files from templates
template "#{node["kibana"]["dir"]}/conf/kibana.yml" do
  source "kibana.yml.erb"
end

template "#{node["kibana"]["dir"]}/startup.sh" do
  source "startup.sh.erb"
end

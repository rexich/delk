# Create directories
directory "#{node["elasticsearch"]["dir"]}/data"

# Create the Dockerfile
file "#{node["elasticsearch"]["dir"]}/Dockerfile" do
  content "FROM elasticsearch:5"
  mode "0644"
end

# Generate the configuration file from a template
template "#{node["elasticsearch"]["dir"]}/elasticsearch.yml" do
  source "elasticsearch.yml"
  mode "0644"
end

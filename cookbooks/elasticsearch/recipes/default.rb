# Recipe for Elasticsearch

# Create directories
directory "#{node["elasticsearch"]["dir"]}"
directory "#{node["elasticsearch"]["dir"]}/conf"
directory "#{node["elasticsearch"]["dir"]}/data"
directory "#{node["elasticsearch"]["dir"]}/logs"

# Create the Dockerfile
file "#{node["elasticsearch"]["dir"]}/Dockerfile" do
  content "FROM elasticsearch:5"
end

# Generate the configuration file from a template
template "#{node["elasticsearch"]["dir"]}/conf/elasticsearch.yml" do
  source "elasticsearch.yml.erb"
  variables({
    min_master_nodes: node["elasticsearch"]["minimum_master_nodes"]
  })
end

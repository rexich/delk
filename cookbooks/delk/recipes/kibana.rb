# Create directories
directory "#{node["kibana"]["dir"]}/config"

# Create the Dockerfile
dockerfile_contents = <<DOCKERFILE_END
FROM kibana:5

# The following is a crude hack, that will make Kibana wait until
# Elasticsearch server is up and running, and then connect on it.

COPY startup.sh /tmp/startup.sh
RUN apt-get -qq update && \
    apt-get install -qq -y netcat bzip2 && \
    chmod +x /tmp/startup.sh

CMD ["/tmp/startup.sh"]
DOCKERFILE_END

file "#{node["kibana"]["dir"]}/Dockerfile" do
  content dockerfile_contents
  mode "0644"
end

# Create the configuration file from a template
template "#{node["elasticsearch"]["dir"]}/kibana.yml" do
  source "kibana/kibana.yml"
  mode "0644"
end

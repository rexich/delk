# Set up a basic DELK environment

# Install Docker, enable and start service
docker_service 'default' do
  action [:create, :start]
end

# Add 'ubuntu' user to 'docker' group, to avoid using sudo
group 'docker' do
  members node.default['delk']['user']
  action :manage
end


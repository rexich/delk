# Recipe for Docker

# Install prerequisite packages
apt_update "update-apt-cache" do
  action :update
end

apt_package "prerequisites-linux" do
  package_name ["curl", "linux-image-extra-" << `uname -r`, "linux-image-extra-virtual"]
end

apt_package "prerequisites-apt" do
  package_name ["apt-transport-https", "ca-certificates"]
end


# Add APT key
execute "add-apt-key" do
  command "curl -fsSL https://yum.dockerproject.org/gpg | sudo apt-key add -"
end

execute "add-apt-repository" do
  command 'sudo add-apt-repository "deb https://apt.dockerproject.org/repo/ ubuntu-' << `lsb_release -cs` << ' main"'
  notifies :update, "apt_update[update-apt-cache]", :immediately
end


# Install Docker Engine
apt_package "docker-engine"


# Add user to "docker" group
group "docker" do
  action :modify
  members node["delk_user"]
  append true
end


# Get Docker Compose and install it
execute "get-docker-compose" do
  command 'curl -L https://github.com/docker/compose/releases/download/1.10.0/docker-compose-' << `uname -s`.chomp << '-' << `uname -m`.chomp << ' -o /usr/local/bin/docker-compose'
  creates "/usr/local/bin/docker-compose"
end

file "/usr/local/bin/docker-compose" do
  owner "root"
  group "root"
  mode "0755"
end

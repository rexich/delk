# Recipe for Docker Engine and Docker Compose

# Add APT key and repository
apt_repository "docker" do
  uri "https://apt.dockerproject.org/repo"
  distribution "ubuntu-#{node["docker"]["ubuntu_release"]}"
  components ["main"]
  key "https://yum.dockerproject.org/gpg"
  action :add
end


# Install Docker Engine and prerequisite packages
apt_package "docker-engine" do
  package_name [
    "curl",
    "linux-image-extra-#{node['docker']['kernel_release']}",
    "linux-image-extra-virtual",
    "apt-transport-https",
    "ca-certificates",
    "docker-engine"
  ]
end


# Add user to "docker" group
group "docker" do
  action :modify
  members node["delk_user"]
  append true
end


# Get Docker Compose and install it
execute "get-docker-compose" do
  command 'curl -L https://github.com/docker/compose/releases/download/1.10.0/docker-compose-Linux-x86_64 -o /usr/local/bin/docker-compose'
  creates "/usr/local/bin/docker-compose"
end

file "/usr/local/bin/docker-compose" do
  owner "root"
  group "root"
  mode "0755"
end

require "serverspec"
require "helper.rb"


# Required by serverspec
set :backend, :exec


# Check directories' ownership
%w( . conf ).each do |dir|
  describe file("#{HOME_DIR}/kibana/#{dir}") do
    it { should be_directory }
    it { should be_owned_by DELK_USER }
    it { should be_grouped_into DELK_USER }
  end
end


# Check configuration files' ownership
%w( Dockerfile conf/kibana.yml startup.sh ).each do |file|
  describe file("#{HOME_DIR}/kibana/#{file}") do
    it { should be_file }
    it { should be_owned_by DELK_USER }
    it { should be_grouped_into DELK_USER }
  end
end


# Check if the Docker image is pulled
describe docker_image('kibana:5') do
  it { should exist }
end

require "serverspec"
require "helper.rb"


# Required by serverspec
set :backend, :exec


# Check directories' ownership
%w( . conf data logs ).each do |dir|
  describe file("#{HOME_DIR}/elasticsearch/#{dir}") do
    it { should be_directory }
    it { should be_owned_by DELK_USER }
    it { should be_grouped_into DELK_USER }
  end
end


# Check configuration files' ownership
%w( Dockerfile conf/elasticsearch.yml ).each do |file|
  describe file("#{HOME_DIR}/elasticsearch/#{file}") do
    it { should be_file }
    it { should be_owned_by DELK_USER }
    it { should be_grouped_into DELK_USER }
  end
end


# Check sysctl configuration file's permission, contents, and ownership
describe file("/etc/sysctl.d/99-increase-max-map-count.conf") do
  it { should be_file }
  it { should be_owned_by "root" }
  it { should be_grouped_into "root" }
  its(:content) { should match /vm\.max_map_count=262144/ }
end


# Check if the Docker image is pulled
describe docker_image('elasticsearch:5') do
  it { should exist }
end
